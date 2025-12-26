import 'package:potato_4cut_v2/domain/make_frame/repositories/frame_repository.dart';

class UploadFileToS3UseCase {
  final FrameRepository _repository;

  UploadFileToS3UseCase(this._repository);

  Future<void> execute(String uploadUrl, List<int> fileBytes, String contentType) async {
    await _repository.uploadFileToS3(uploadUrl, fileBytes, contentType);
  }
}
