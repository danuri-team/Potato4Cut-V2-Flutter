// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      provider: $enumDecode(_$AuthProviderTypeEnumMap, json['provider']),
      oauthToken: json['oauthToken'] as String,
      deviceToken: json['deviceToken'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'provider': _$AuthProviderTypeEnumMap[instance.provider]!,
      'oauthToken': instance.oauthToken,
      'deviceToken': instance.deviceToken,
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.GOOGLE: 'GOOGLE',
  AuthProviderType.APPLE: 'APPLE',
  AuthProviderType.NONE: 'NONE',
};
