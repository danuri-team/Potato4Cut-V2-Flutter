// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_frame_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFrameCommentRequest _$AddFrameCommentRequestFromJson(
  Map<String, dynamic> json,
) => AddFrameCommentRequest(
  content: json['content'] as String,
  parentConmment: json['parentConmment'] as String,
);

Map<String, dynamic> _$AddFrameCommentRequestToJson(
  AddFrameCommentRequest instance,
) => <String, dynamic>{
  'content': instance.content,
  'parentConmment': instance.parentConmment,
};
