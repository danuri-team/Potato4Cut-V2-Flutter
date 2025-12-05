// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      userId: json['userId'] as String,
      provider: $enumDecode(_$AuthProviderTypeEnumMap, json['provider']),
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      role: $enumDecode(_$UserTypeEnumMap, json['role']),
      token: TokenModel.fromJson(json['token'] as Map<String, dynamic>),
      newUser: json['newUser'] as bool,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'provider': _$AuthProviderTypeEnumMap[instance.provider]!,
      'nickname': instance.nickname,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'role': _$UserTypeEnumMap[instance.role]!,
      'token': instance.token,
      'newUser': instance.newUser,
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.GOOGLE: 'GOOGLE',
  AuthProviderType.APPLE: 'APPLE',
  AuthProviderType.NONE: 'NONE',
};

const _$UserTypeEnumMap = {UserType.USER: 'USER', UserType.ADMIN: 'ADMIN'};
