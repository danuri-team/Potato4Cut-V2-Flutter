import 'package:potato_4cut_v2/features/login/data/models/login_response_dto.dart';

class AuthResult {
  final String accessToken;
  final String refreshToken;
  final LoginResponseDto user;
  final bool newUser;

  const AuthResult({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
    required this.newUser,
  });
}

abstract class AuthRepository {
  Future<AuthResult> login({
    required String provider,
    required String token,
    required String deviceToken,
  });

  Future<AuthResult> refreshToken(String refreshToken);

  Future<void> logout();
}
