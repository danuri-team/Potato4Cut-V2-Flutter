// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyInfoResponseModel _$GetMyInfoResponseModelFromJson(
  Map<String, dynamic> json,
) => GetMyInfoResponseModel(
  json['success'] as bool,
  MyInfoDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetMyInfoResponseModelToJson(
  GetMyInfoResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

MyInfoDataModel _$MyInfoDataModelFromJson(Map<String, dynamic> json) =>
    MyInfoDataModel(
      json['userId'] as String,
      json['nickname'] as String,
      $enumDecode(_$AuthProviderTypeEnumMap, json['provider']),
      json['email'] as String,
      json['profileImageUrl'] as String?,
      json['bio'] as String?,
      $enumDecode(_$UserTypeEnumMap, json['role']),
    );

Map<String, dynamic> _$MyInfoDataModelToJson(MyInfoDataModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'provider': _$AuthProviderTypeEnumMap[instance.provider]!,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'bio': instance.bio,
      'role': _$UserTypeEnumMap[instance.role]!,
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.GOOGLE: 'GOOGLE',
  AuthProviderType.APPLE: 'APPLE',
  AuthProviderType.NONE: 'NONE',
};

const _$UserTypeEnumMap = {UserType.USER: 'USER', UserType.ADMIN: 'ADMIN'};
