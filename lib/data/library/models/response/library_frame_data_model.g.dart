// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_frame_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryFrameDataModel _$LibraryFrameDataModelFromJson(
  Map<String, dynamic> json,
) => LibraryFrameDataModel(
  json['frameId'] as String,
  json['title'] as String,
  json['previewImageUrl'] as String,
  json['frameBaseImageUrl'] as String,
  json['frameOverlayImageUrl'] as String,
  $enumDecode(_$FrameCategoryTypeEnumMap, json['category']),
  json['bookmarked'] as bool,
  json['addedAt'] as String?,
  json['lastUsedAt'] as String?,
  json['creatorId'] as String,
  json['creatorNickname'] as String,
);

Map<String, dynamic> _$LibraryFrameDataModelToJson(
  LibraryFrameDataModel instance,
) => <String, dynamic>{
  'frameId': instance.frameId,
  'title': instance.title,
  'previewImageUrl': instance.previewImageUrl,
  'frameBaseImageUrl': instance.frameBaseImageUrl,
  'frameOverlayImageUrl': instance.frameOverlayImageUrl,
  'category': _$FrameCategoryTypeEnumMap[instance.category]!,
  'bookmarked': instance.bookmarked,
  'addedAt': instance.addedAt,
  'lastUsedAt': instance.lastUsedAt,
  'creatorId': instance.creatorId,
  'creatorNickname': instance.creatorNickname,
};

const _$FrameCategoryTypeEnumMap = {FrameCategoryType.CUTE: 'CUTE'};
