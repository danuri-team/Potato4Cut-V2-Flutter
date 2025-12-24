// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
  json['commentId'] as String,
  json['content'] as String,
  json['userId'] as String,
  json['userNickname'] as String,
  json['userProfileIamgeUrl'] as String?,
  json['createdAt'] as String,
  json['updatedAt'] as String,
  json['owner'] as bool,
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'content': instance.content,
      'userId': instance.userId,
      'userNickname': instance.userNickname,
      'userProfileIamgeUrl': instance.userProfileIamgeUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'owner': instance.owner,
    };
