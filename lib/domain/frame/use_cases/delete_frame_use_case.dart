import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class DeleteFrameUseCase {
  final FrameRepository _repository;

  DeleteFrameUseCase(this._repository);

  Future<void> deleteFrame(String frameId) async {
    return await _repository.deleteFrame(frameId);
  }
}
