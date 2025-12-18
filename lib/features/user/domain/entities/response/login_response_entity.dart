import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/enum/user_type.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/token_response_entity.dart';

class LoginResponseEntity {
  final String userId;
  final AuthProviderType provider;
  final String nickname;
  final String email;
  String? profileImageUrl;
  final UserType role;
  final TokenResponseEntity token;
  final bool newUser;

  LoginResponseEntity({
    required this.userId,
    required this.provider,
    required this.nickname,
    required this.email,
    this.profileImageUrl,
    required this.role,
    required this.token,
    required this.newUser,
  });
}