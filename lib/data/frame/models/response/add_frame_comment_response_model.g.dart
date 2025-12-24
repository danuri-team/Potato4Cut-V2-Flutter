// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_frame_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFrameCommentResponseModel _$AddFrameCommentResponseModelFromJson(
  Map<String, dynamic> json,
) => AddFrameCommentResponseModel(
  json['success'] as bool,
  CommentModel.fromJson(json['data'] as Map<String, dynamic>),
  json['message'] as String,
);

Map<String, dynamic> _$AddFrameCommentResponseModelToJson(
  AddFrameCommentResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};
