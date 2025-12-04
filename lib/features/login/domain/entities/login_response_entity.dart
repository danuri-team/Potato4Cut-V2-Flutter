import 'package:potato_4cut_v2/features/login/domain/entities/token_entity.dart';

class LoginResponseEntity {
  final String userId;
  final String nickname;
  final String email;
  String? profileImageUrl;
  final String role;
  final TokenEntity token;
  final bool newUser;

  LoginResponseEntity({
    required this.userId,
    required this.nickname,
    required this.email,
    this.profileImageUrl,
    required this.role,
    required this.token,
    required this.newUser,
  });
}