// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) =>
    LoginRequestDto(
      provider: json['provider'] as String,
      oauthToken: json['oauthToken'] as String,
      deviceToken: json['deviceToken'] as String,
    );

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'oauthToken': instance.oauthToken,
      'deviceToken': instance.deviceToken,
    };
