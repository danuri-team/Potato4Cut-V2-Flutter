// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) => TokenDto(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      userId: json['userId'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      role: json['role'] as String,
      token: TokenDto.fromJson(json['token'] as Map<String, dynamic>),
      newUser: json['newUser'] as bool,
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'role': instance.role,
      'token': instance.token,
      'newUser': instance.newUser,
    };
