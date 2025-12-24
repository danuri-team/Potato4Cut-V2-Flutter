// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_frame_comment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFrameCommentRequestModel _$AddFrameCommentRequestModelFromJson(
  Map<String, dynamic> json,
) => AddFrameCommentRequestModel(
  json['content'] as String,
  json['parentComment'] as String,
);

Map<String, dynamic> _$AddFrameCommentRequestModelToJson(
  AddFrameCommentRequestModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'parentComment': instance.parentComment,
};
