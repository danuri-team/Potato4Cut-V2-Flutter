import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/services/fcm_service.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/user/data/data_sources/users_data_source.dart';
import 'package:potato_4cut_v2/features/user/data/data_sources/users_data_source_impl.dart';
import 'package:potato_4cut_v2/features/user/data/repositories/users_repository_impl.dart';
import 'package:potato_4cut_v2/features/user/domain/repositories/users_repository.dart';
import 'package:potato_4cut_v2/features/user/domain/use_cases/users_use_cases.dart';
import 'package:potato_4cut_v2/features/user/domain/use_cases/get_my_info_use_case.dart';
import 'package:potato_4cut_v2/features/user/domain/use_cases/login_use_case.dart';
import 'package:potato_4cut_v2/features/user/domain/use_cases/logout_use_case.dart';
import 'package:potato_4cut_v2/features/user/domain/use_cases/profile_update_use_case.dart';
import 'package:potato_4cut_v2/features/user/domain/use_cases/refresh_token_use_case.dart';
import 'package:potato_4cut_v2/features/user/provider/auth_state.dart';
import 'package:potato_4cut_v2/features/user/provider/stoarage_provider.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/get_my_info_entity.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final usersDataSourceProvider = Provider<UsersDataSource>((ref) => UsersDataSourceImpl(null));

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final dataSource = ref.watch(usersDataSourceProvider);
  return UsersRepositoryImpl(dataSource);
});

final tokenStorageProvider = Provider<TokenStorage>((ref) => TokenStorage());

final usersUseCasesProvider = Provider<UsersUseCases>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  final loginUseCase = LoginUseCase(repository);
  final profileUpdateUseCase = ProfileUpdateUseCase(repository);
  final getMyInfoUsecase = GetMyInfoUseCase(repository);
  final refreshTokenUseCase = RefreshTokenUseCase(repository);
  final logoutUseCase = LogoutUseCase(repository);
  return UsersUseCases(
    loginUseCase,
    profileUpdateUseCase,
    getMyInfoUsecase,
    refreshTokenUseCase,
    logoutUseCase,
  );
});

final usersProvider = StateNotifierProvider<UsersViewModelNotifier, AuthState>((ref) {
  final useCases = ref.watch(usersUseCasesProvider);
  final fcmService = ref.watch(fcmServiceProvider);
  final googleSignIn = ref.watch(googleSignInProvider);
  final storage = ref.watch(tokenStorageProvider);
  return UsersViewModelNotifier(useCases, fcmService, googleSignIn, ref, storage);
});

class UsersViewModelNotifier extends StateNotifier<AuthState> {
  final UsersUseCases _useCases;
  final FcmService _fcmService;
  final GoogleSignIn _googleSignIn;
  final Ref _ref;
  final TokenStorage _storage;

  UsersViewModelNotifier(
    this._useCases,
    this._fcmService,
    this._googleSignIn,
    this._ref,
    this._storage,
  ) : super(const AuthState());

  Future<void> loginWithApple() async {
    state = state.copyWith(
      isLoading: true,
      loadingProvider: AuthProviderType.APPLE,
      errorMessage: null,
    );

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final token = credential.identityToken;
      if (token == null) {
        throw Exception('Apple Sign In failed: No identity token');
      }

      await _login(provider: AuthProviderType.APPLE, token: token);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        isLoading: false,
        loadingProvider: null,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(
      isLoading: true,
      loadingProvider: AuthProviderType.GOOGLE,
      errorMessage: null,
    );

    try {
      await _googleSignIn.signOut();

      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        state = state.copyWith(isLoading: false, loadingProvider: null);
        return;
      }

      final googleAuth = await googleUser.authentication;
      final token = googleAuth.accessToken;
      if (token == null) {
        throw Exception('Google Sign In failed: No accessToken token');
      }

      await _login(provider: AuthProviderType.GOOGLE, token: token);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        isLoading: false,
        loadingProvider: null,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> _login({required AuthProviderType provider, required String token}) async {
    try {
      final deviceToken = await _fcmService.getToken();

      final result = await _useCases.loginUseCase.login(
        provider,
        token,
        deviceToken,
      );

      await _storage.setAccessAndRefreshToken(
        result.token.accessToken,
        result.token.refreshToken,
      );

      state = state.copyWith(
        status: AuthStatus.authenticated,
        accessToken: result.token.accessToken,
        refreshToken: result.token.refreshToken,
        isLoading: false,
        loadingProvider: null,
        errorMessage: null,
        newUser: result.newUser,
      );

      await _ref.read(storageProvider.notifier).login();
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        accessToken: null,
        refreshToken: null,
        isLoading: false,
        loadingProvider: null,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<MyInfoDataEntity> profileUpdate({
    required String nickname,
    String? bio,
    required String profilePresetId,
    File? profileImage,
  }) async {
    final response = await _useCases.profileUpdateUseCase.profileUpdate(
      nickname,
      bio,
      profilePresetId,
      profileImage,
    );

    return response;
  }

  Future<GetMyInfoEntity> getMyInfo() async{
    final response = await _useCases.getMyInfoUseCase.getMyInfo();
    return response;
  }

  Future<void> refreshToken() async {
    if (state.refreshToken == null) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: 'No refresh token available',
      );
      return;
    }

    try {
      final result = await _useCases.refreshTokenUseCase.refreshToken(
        state.refreshToken!,
      );
      await _storage.setAccessAndRefreshToken(
        result.accessToken,
        result.refreshToken,
      );

      state = state.copyWith(
        status: AuthStatus.authenticated,
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        accessToken: null,
        refreshToken: null,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      await _googleSignIn.signOut();
      await _useCases.logoutUseCase.logout();

      state = const AuthState(
        status: AuthStatus.unauthenticated,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(scopes: ['email']);
});
