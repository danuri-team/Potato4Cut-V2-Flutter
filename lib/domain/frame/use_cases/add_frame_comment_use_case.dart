import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_comment_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/add_frame_comment_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class AddFrameCommentUseCase {
  final FrameRepository _repository;

  AddFrameCommentUseCase(this._repository);

  Future<AddFrameCommentResponseEntity> addFrameComment(String frameId, AddFrameCommentRequestEntity request) async {
    return await _repository.addFrameComment(frameId, request);
  }
}
