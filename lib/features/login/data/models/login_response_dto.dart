import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class TokenDto {
  final String accessToken;
  final String refreshToken;

  const TokenDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
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
}
