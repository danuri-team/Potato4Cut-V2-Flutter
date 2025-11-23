import 'package:potato_4cut_v2/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:potato_4cut_v2/features/login/data/models/login_request_dto.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<AuthResult> login({
    required String provider,
    required String token,
    required String deviceToken,
  }) async {
    try {
      final request = LoginRequestDto(
        provider: provider,
        oauthToken: token,
        deviceToken: deviceToken,
      );

      final response = await _remoteDataSource.login(request);

      return AuthResult(
        accessToken: response.token.accessToken,
        refreshToken: response.token.refreshToken,
        user: response,
        newUser: response.newUser,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResult> refreshToken(String refreshToken) async {
    try {
      final response = await _remoteDataSource.refreshToken(refreshToken);

      return AuthResult(
        accessToken: response.token.accessToken,
        refreshToken: response.token.refreshToken,
        user: response,
        newUser: response.newUser,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (e) {
      rethrow;
    }
  }
}
