// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdateRequestModel _$ProfileUpdateRequestModelFromJson(
  Map<String, dynamic> json,
) => ProfileUpdateRequestModel(
  json['nickname'] as String,
  json['bio'] as String?,
  json['profilePresetId'] as String,
  json['profileImageKey'] as String,
);

Map<String, dynamic> _$ProfileUpdateRequestModelToJson(
  ProfileUpdateRequestModel instance,
) => <String, dynamic>{
  'nickname': instance.nickname,
  'bio': instance.bio,
  'profilePresetId': instance.profilePresetId,
  'profileImageKey': instance.profileImageKey,
};
