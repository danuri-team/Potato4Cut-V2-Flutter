import 'package:potato_4cut_v2/domain/frame/entities/response/detailed_frame_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class GetDetailedFrameUseCase {
  final FrameRepository _repository;

  GetDetailedFrameUseCase(this._repository);

  Future<DetailedFrameResponseEntity> getDetailedFrame(String frameId) async {
    return await _repository.getDetailedFrame(frameId);
  }
}
