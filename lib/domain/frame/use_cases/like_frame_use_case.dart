import 'package:potato_4cut_v2/domain/frame/entities/response/success_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class LikeFrameUseCase {
  final FrameRepository _repository;

  LikeFrameUseCase(this._repository);

  Future<SuccessResponseEntity> likeFrame(String frameId) async {
    return await _repository.likeFrame(frameId);
  }
}
