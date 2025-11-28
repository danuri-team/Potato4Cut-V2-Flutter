import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/login_result_entity.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class TokenDto {
  final String accessToken;
  final String refreshToken;

  const TokenDto({required this.accessToken, required this.refreshToken});

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);

  TokenEntity toEntity() {
    return TokenEntity(accessToken: accessToken, refreshToken: refreshToken);
  }
}

@JsonSerializable()
class LoginResponseDto {
  final String userId;
  final String nickname;
  final String email;
  final String? profileImageUrl;
  final String role;
  final TokenDto token;
  final bool newUser;

  const LoginResponseDto({
    required this.userId,
    required this.nickname,
    required this.email,
    this.profileImageUrl,
    required this.role,
    required this.token,
    required this.newUser,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  LoginResultEntity toEntity() {
    final TokenEntity token = TokenEntity(
      accessToken: this.token.accessToken,
      refreshToken: this.token.refreshToken,
    );
    return LoginResultEntity(
      userId: userId,
      nickname: nickname,
      email: email,
      role: role,
      token: token,
      newUser: newUser,
    );
  }
}
