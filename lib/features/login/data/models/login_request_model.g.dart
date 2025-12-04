// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      provider: json['provider'] as String,
      oauthToken: json['oauthToken'] as String,
      deviceToken: json['deviceToken'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'oauthToken': instance.oauthToken,
      'deviceToken': instance.deviceToken,
    };
