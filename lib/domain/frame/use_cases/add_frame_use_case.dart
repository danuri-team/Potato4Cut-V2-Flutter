import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class AddFrameUseCase {
  final FrameRepository _repository;

  AddFrameUseCase(this._repository);

  Future addFrame(AddFrameRequestEntity request) async {
    return await _repository.addFrame(request);
  }
}
