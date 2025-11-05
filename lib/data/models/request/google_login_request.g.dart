// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLoginRequest _$GoogleLoginRequestFromJson(Map<String, dynamic> json) =>
    GoogleLoginRequest(
      provider: $enumDecode(_$SocialProviderEnumMap, json['provider']),
      oauthToken: json['oauthToken'] as String,
      deviceToken: json['deviceToken'] as String,
    );

Map<String, dynamic> _$GoogleLoginRequestToJson(GoogleLoginRequest instance) =>
    <String, dynamic>{
      'provider': _$SocialProviderEnumMap[instance.provider]!,
      'oauthToken': instance.oauthToken,
      'deviceToken': instance.deviceToken,
    };

const _$SocialProviderEnumMap = {
  SocialProvider.GOOGLE: 'GOOGLE',
  SocialProvider.APPLE: 'APPLE',
};
