import 'package:potato_4cut_v2/features/login/domain/entities/login_response_entity.dart';

class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final LoginResponseEntity user;
  final bool newUser;

  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
    required this.newUser,
  });
}