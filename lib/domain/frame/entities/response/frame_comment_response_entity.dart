import 'package:potato_4cut_v2/domain/frame/entities/response/comment_entity.dart';

class FrameCommentResponseEntity {
  final bool success;
  final FrameCommentDataEntity data;

  const FrameCommentResponseEntity(this.success, this.data);
}

class FrameCommentDataEntity{
  final List<CommentEntity> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const FrameCommentDataEntity(
    this.content,
    this.currentPage,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
    this.hasNext,
    this.hasPrevious,
  );
}