import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/login/data/models/token_response_model.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/login_response_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/token_entity.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String userId;
  final String nickname;
  final String email;
  final String? profileImageUrl;
  final String role;
  final TokenModel token;
  final bool newUser;

  const LoginResponseModel({
    required this.userId,
    required this.nickname,
    required this.email,
    this.profileImageUrl,
    required this.role,
    required this.token,
    required this.newUser,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  LoginResponseEntity toEntity() {
    final TokenEntity token = TokenEntity(
      this.token.accessToken,
      this.token.refreshToken,
    );
    return LoginResponseEntity(
      userId: userId,
      nickname: nickname,
      email: email,
      role: role,
      token: token,
      newUser: newUser,
    );
  }
}