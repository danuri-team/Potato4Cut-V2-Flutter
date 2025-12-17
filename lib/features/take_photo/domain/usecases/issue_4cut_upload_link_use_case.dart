
import 'package:potato_4cut_v2/features/take_photo/domain/entites/request/issue_4cut_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/response/fourcut_upload_link_response_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/repositories/photo_repository.dart';

class Issue4cutUploadLinkUseCase {
  final PhotoRepository _repository;

  Issue4cutUploadLinkUseCase(this._repository);

  Future<FourcutUploadLinkResponseEntity> issue4CutUploadLink(Issue4cutUploadLinkRequestEntity request) async{ 
    final response = await _repository.issue4CutUploadLink(request);
    return response;
  }
}