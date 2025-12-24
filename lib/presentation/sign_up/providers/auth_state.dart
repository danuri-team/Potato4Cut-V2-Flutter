import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/login_response_entity.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
}

class AuthState {
  final AuthStatus status;
  final String? accessToken;
  final String? refreshToken;
  final String? errorMessage;
  final bool isLoading;
  final AuthProviderType? loadingProvider;
  final bool newUser;

  const AuthState({
    this.status = AuthStatus.initial,
    this.accessToken,
    this.refreshToken,
    this.errorMessage,
    this.isLoading = false,
    this.loadingProvider,
    this.newUser = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    LoginResponseEntity? user,
    String? accessToken,
    String? refreshToken,
    String? errorMessage,
    bool? isLoading,
    AuthProviderType? loadingProvider,
    bool? newUser,
  }) {
    return AuthState(
      status: status ?? this.status,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      loadingProvider: loadingProvider,
      newUser: newUser ?? this.newUser,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated;

  bool isLoadingFor(AuthProviderType provider) => isLoading && loadingProvider == provider;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        other.status == status &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.errorMessage == errorMessage &&
        other.isLoading == isLoading &&
        other.loadingProvider == loadingProvider &&
        other.newUser == newUser;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode ^
        errorMessage.hashCode ^
        isLoading.hashCode ^
        loadingProvider.hashCode ^
        newUser.hashCode;
  }

  @override
  String toString() {
    return 'AuthState(status: $status, isLoading: $isLoading, error: $errorMessage)';
  }
}
