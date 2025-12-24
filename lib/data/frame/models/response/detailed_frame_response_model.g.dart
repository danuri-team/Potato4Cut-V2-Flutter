// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_frame_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedFrameResponseModel _$DetailedFrameResponseModelFromJson(
  Map<String, dynamic> json,
) => DetailedFrameResponseModel(
  json['success'] as bool,
  DetailedFrameDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetailedFrameResponseModelToJson(
  DetailedFrameResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

DetailedFrameDataModel _$DetailedFrameDataModelFromJson(
  Map<String, dynamic> json,
) => DetailedFrameDataModel(
  json['frameId'] as String,
  json['title'] as String,
  json['description'] as String,
  json['frameBaseImageUrl'] as String?,
  json['frameOverlayImageUrl'] as String?,
  json['previewImageUrl'] as String,
  $enumDecode(_$FrameCategoryTypeEnumMap, json['category']),
  $enumDecode(_$FrameStatusTypeEnumMap, json['status']),
  (json['price'] as num).toInt(),
  (json['downloadCount'] as num).toInt(),
  (json['likecount'] as num).toInt(),
  (json['viewCount'] as num).toInt(),
  json['creatorId'] as String,
  json['creatorNickname'] as String,
  json['creatorProfileImageUrl'] as String?,
  (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  json['createdAt'] as String,
  json['approvedAt'] as String,
  json['public'] as bool,
  json['liked'] as bool,
  json['inLibrary'] as bool,
);

Map<String, dynamic> _$DetailedFrameDataModelToJson(
  DetailedFrameDataModel instance,
) => <String, dynamic>{
  'frameId': instance.frameId,
  'title': instance.title,
  'description': instance.description,
  'frameBaseImageUrl': instance.frameBaseImageUrl,
  'frameOverlayImageUrl': instance.frameOverlayImageUrl,
  'previewImageUrl': instance.previewImageUrl,
  'category': _$FrameCategoryTypeEnumMap[instance.category]!,
  'status': _$FrameStatusTypeEnumMap[instance.status]!,
  'price': instance.price,
  'downloadCount': instance.downloadCount,
  'likecount': instance.likecount,
  'viewCount': instance.viewCount,
  'creatorId': instance.creatorId,
  'creatorNickname': instance.creatorNickname,
  'creatorProfileImageUrl': instance.creatorProfileImageUrl,
  'tags': instance.tags,
  'createdAt': instance.createdAt,
  'approvedAt': instance.approvedAt,
  'public': instance.public,
  'liked': instance.liked,
  'inLibrary': instance.inLibrary,
};

const _$FrameCategoryTypeEnumMap = {FrameCategoryType.CUTE: 'CUTE'};

const _$FrameStatusTypeEnumMap = {FrameStatusType.APPROVED: 'APPROVED'};
