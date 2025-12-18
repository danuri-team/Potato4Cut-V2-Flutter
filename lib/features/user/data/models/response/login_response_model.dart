import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/enum/user_type.dart';
import 'package:potato_4cut_v2/features/user/data/models/request/token_response_model.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/login_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/token_response_entity.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String userId;
  final AuthProviderType provider;
  final String nickname;
  final String email;
  String? profileImageUrl;
  final UserType role;
  final TokenModel token;
  final bool newUser;

  LoginResponseModel({
    required this.userId,
    required this.provider,
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
    final TokenResponseEntity token = TokenResponseEntity(
      this.token.accessToken,
      this.token.refreshToken,
    );
    return LoginResponseEntity(
      userId: userId,
      provider: provider,
      nickname: nickname,
      email: email,
      profileImageUrl: profileImageUrl,
      role: role,
      token: token,
      newUser: newUser,
    );
  }
}