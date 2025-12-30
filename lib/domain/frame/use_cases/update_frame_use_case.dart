import 'package:potato_4cut_v2/domain/frame/entities/request/update_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class UpdateFrameUseCase {
  final FrameRepository _repository;

  UpdateFrameUseCase(this._repository);

  Future updateFrame(String frameId, UpdateFrameRequestEntity request) async {
    return await _repository.updateFrame(frameId, request);
  }
}
