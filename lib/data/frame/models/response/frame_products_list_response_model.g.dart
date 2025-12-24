// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_products_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrameProductsListResponseModel _$FrameProductsListResponseModelFromJson(
  Map<String, dynamic> json,
) => FrameProductsListResponseModel(
  json['success'] as bool,
  FrameProductsListDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FrameProductsListResponseModelToJson(
  FrameProductsListResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

FrameProductsListDataModel _$FrameProductsListDataModelFromJson(
  Map<String, dynamic> json,
) => FrameProductsListDataModel(
  (json['content'] as List<dynamic>)
      .map((e) => FrameProcutContentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['currentPage'] as num).toInt(),
  (json['pageSize'] as num).toInt(),
  (json['totalElements'] as num).toInt(),
  (json['totalPages'] as num).toInt(),
  json['first'] as bool,
  json['last'] as bool,
  json['hasNext'] as bool,
  json['hasPrevious'] as bool,
);

Map<String, dynamic> _$FrameProductsListDataModelToJson(
  FrameProductsListDataModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'currentPage': instance.currentPage,
  'pageSize': instance.pageSize,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};

FrameProcutContentModel _$FrameProcutContentModelFromJson(
  Map<String, dynamic> json,
) => FrameProcutContentModel(
  json['frameId'] as String,
  json['title'] as String,
  json['previewImageUrl'] as String,
  $enumDecode(_$FrameCategoryTypeEnumMap, json['category']),
  $enumDecode(_$FrameStatusTypeEnumMap, json['status']),
  (json['price'] as num).toInt(),
  (json['downloadCount'] as num).toInt(),
  (json['likeCount'] as num).toInt(),
  (json['viewCount'] as num).toInt(),
  json['creatorId'] as String,
  json['creatorNickname'] as String,
  json['createdAt'] as String,
  json['public'] as bool,
);

Map<String, dynamic> _$FrameProcutContentModelToJson(
  FrameProcutContentModel instance,
) => <String, dynamic>{
  'frameId': instance.frameId,
  'title': instance.title,
  'previewImageUrl': instance.previewImageUrl,
  'category': _$FrameCategoryTypeEnumMap[instance.category]!,
  'status': _$FrameStatusTypeEnumMap[instance.status]!,
  'price': instance.price,
  'downloadCount': instance.downloadCount,
  'likeCount': instance.likeCount,
  'viewCount': instance.viewCount,
  'creatorId': instance.creatorId,
  'creatorNickname': instance.creatorNickname,
  'createdAt': instance.createdAt,
  'public': instance.public,
};

const _$FrameCategoryTypeEnumMap = {FrameCategoryType.CUTE: 'CUTE'};

const _$FrameStatusTypeEnumMap = {FrameStatusType.APPROVED: 'APPROVED'};
