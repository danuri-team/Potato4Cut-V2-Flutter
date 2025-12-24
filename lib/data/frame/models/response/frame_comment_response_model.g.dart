// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrameCommentResponseModel _$FrameCommentResponseModelFromJson(
  Map<String, dynamic> json,
) => FrameCommentResponseModel(
  json['success'] as bool,
  FrameCommentDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FrameCommentResponseModelToJson(
  FrameCommentResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

FrameCommentDataModel _$FrameCommentDataModelFromJson(
  Map<String, dynamic> json,
) => FrameCommentDataModel(
  (json['content'] as List<dynamic>)
      .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$FrameCommentDataModelToJson(
  FrameCommentDataModel instance,
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
