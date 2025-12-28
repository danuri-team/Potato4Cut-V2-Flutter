// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_4cut_photos_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Save4cutPhotosRequestModel _$Save4cutPhotosRequestModelFromJson(
  Map<String, dynamic> json,
) => Save4cutPhotosRequestModel(
  json['frameId'] as String,
  json['objectKey'] as String,
  $enumDecode(_$PhotoShareTypeEnumMap, json['photoShareType']),
  json['expireAt'] as String,
);

Map<String, dynamic> _$Save4cutPhotosRequestModelToJson(
  Save4cutPhotosRequestModel instance,
) => <String, dynamic>{
  'frameId': instance.frameId,
  'objectKey': instance.objectKey,
  'photoShareType': _$PhotoShareTypeEnumMap[instance.photoShareType]!,
  'expireAt': instance.expireAt,
};

const _$PhotoShareTypeEnumMap = {
  PhotoShareType.LINK: 'LINK',
  PhotoShareType.PRIVATE: 'PRIVATE',
};
