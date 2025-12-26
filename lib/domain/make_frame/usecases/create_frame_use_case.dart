import 'package:potato_4cut_v2/domain/make_frame/entities/request/create_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/create_frame_response_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/repositories/frame_repository.dart';

class CreateFrameUseCase {
  final FrameRepository _repository;

  CreateFrameUseCase(this._repository);

  Future<CreateFrameResponseEntity> execute(
    CreateFrameRequestEntity request,
  ) async {
    return await _repository.createFrame(request);
  }
}
