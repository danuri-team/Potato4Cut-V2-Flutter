
import 'package:potato_4cut_v2/data/common/domain/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/data/common/domain/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/photos/repositories/photo_repository.dart';

class Issue4cutUploadLinkUseCase {
  final PhotoRepository _repository;

  Issue4cutUploadLinkUseCase(this._repository);

  Future<UploadLinkResponseEntity> issue4CutUploadLink(IssueUploadLinkRequestEntity request) async{ 
    final response = await _repository.issue4CutUploadLink(request);
    return response;
  }
}