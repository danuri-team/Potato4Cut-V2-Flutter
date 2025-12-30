import 'package:potato_4cut_v2/data/frame/models/request/add_frame_comment_request_model.dart';

class AddFrameCommentRequestEntity {
  final String content;
  final String parentComment;

  const AddFrameCommentRequestEntity(this.content, this.parentComment);

  AddFrameCommentRequestModel toModel() {
    return AddFrameCommentRequestModel(content, parentComment);
  }
}