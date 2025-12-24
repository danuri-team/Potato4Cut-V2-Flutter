import 'package:potato_4cut_v2/domain/frame/entities/response/comment_entity.dart';

class AddFrameCommentResponseEntity {
  final bool success;
  final CommentEntity data;
  final String message;

  const AddFrameCommentResponseEntity(this.success, this.data, this.message);
}
