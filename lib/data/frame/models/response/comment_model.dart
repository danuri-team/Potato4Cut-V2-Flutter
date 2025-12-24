import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/comment_entity.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  final String commentId;
  final String content;
  final String userId;
  final String userNickname;
  String? userProfileIamgeUrl;
  final String createdAt;
  final String updatedAt;
  final bool owner;

  CommentModel(
    this.commentId,
    this.content,
    this.userId,
    this.userNickname,
    this.userProfileIamgeUrl,
    this.createdAt,
    this.updatedAt,
    this.owner,
  );

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  CommentEntity toEntity() {
    return CommentEntity(
      commentId,
      content,
      userId,
      userNickname,
      userProfileIamgeUrl,
      createdAt,
      updatedAt,
      owner,
    );
  }
}
