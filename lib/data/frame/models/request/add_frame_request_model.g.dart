// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_frame_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFrameRequestModel _$AddFrameRequestModelFromJson(
  Map<String, dynamic> json,
) => AddFrameRequestModel(
  json['title'] as String,
  json['description'] as String,
  json['isPublic'] as String,
  (json['price'] as num).toInt(),
  json['frameBaseImageKey'] as String,
  json['frameOverlayImageKey'] as String,
  json['previewImageKey'] as String,
  $enumDecode(_$FrameCategoryTypeEnumMap, json['category']),
  (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AddFrameRequestModelToJson(
  AddFrameRequestModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'isPublic': instance.isPublic,
  'price': instance.price,
  'frameBaseImageKey': instance.frameBaseImageKey,
  'frameOverlayImageKey': instance.frameOverlayImageKey,
  'previewImageKey': instance.previewImageKey,
  'category': _$FrameCategoryTypeEnumMap[instance.category]!,
  'tags': instance.tags,
};

const _$FrameCategoryTypeEnumMap = {FrameCategoryType.CUTE: 'CUTE'};
