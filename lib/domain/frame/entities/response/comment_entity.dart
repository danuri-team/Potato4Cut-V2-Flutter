class CommentEntity {
  final String commentId;
  final String content;
  final String userId;
  final String userNickname;
  String? userProfileIamgeUrl;
  final String createdAt;
  final String updatedAt;
  final bool owner;

  CommentEntity(
    this.commentId,
    this.content,
    this.userId,
    this.userNickname,
    this.userProfileIamgeUrl,
    this.createdAt,
    this.updatedAt,
    this.owner,
  );
}