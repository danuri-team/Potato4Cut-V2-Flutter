import 'package:potato_4cut_v2/features/login/domain/entities/login_result_entity.dart';

class AuthResultEntity {
  final String accessToken;
  final String refreshToken;
  final LoginResultEntity user;
  final bool newUser;

  const AuthResultEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
    required this.newUser,
  });
}