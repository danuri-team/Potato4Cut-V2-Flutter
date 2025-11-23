import 'package:potato_4cut_v2/features/login/data/models/login_response_dto.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
}

class AuthState {
  final AuthStatus status;
  final LoginResponseDto? user;
  final String? accessToken;
  final String? refreshToken;
  final String? errorMessage;
  final bool isLoading;
  final String? loadingProvider;
  final bool newUser;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.accessToken,
    this.refreshToken,
    this.errorMessage,
    this.isLoading = false,
    this.loadingProvider,
    this.newUser = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    LoginResponseDto? user,
    String? accessToken,
    String? refreshToken,
    String? errorMessage,
    bool? isLoading,
    String? loadingProvider,
    bool? newUser,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      loadingProvider: loadingProvider,
      newUser: newUser ?? this.newUser,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated;

  bool isLoadingFor(String provider) => isLoading && loadingProvider == provider;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        other.status == status &&
        other.user == user &&
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
        user.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode ^
        errorMessage.hashCode ^
        isLoading.hashCode ^
        loadingProvider.hashCode ^
        newUser.hashCode;
  }

  @override
  String toString() {
    return 'AuthState(status: $status, user: $user, isLoading: $isLoading, error: $errorMessage)';
  }
}
