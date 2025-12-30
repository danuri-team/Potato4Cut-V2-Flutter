import 'package:potato_4cut_v2/domain/frame/entities/response/success_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class CancleLikeFrameUseCase {
  final FrameRepository _repository;

  CancleLikeFrameUseCase(this._repository);

  Future<SuccessResponseEntity> cancleLikeFrame(String frameId) async {
    return await _repository.cancleLikeFrame(frameId);
  }
}
