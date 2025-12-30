import 'package:potato_4cut_v2/domain/frame/entities/response/frame_comment_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class GetFrameCommentUseCase {
  final FrameRepository _repository;

  GetFrameCommentUseCase(this._repository);

  Future<FrameCommentResponseEntity> getFrameComment(String frameId) async {
    return await _repository.getFrameComment(frameId);
  }
}
