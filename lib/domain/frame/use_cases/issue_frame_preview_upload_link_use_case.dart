import 'package:potato_4cut_v2/domain/common/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/common/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class IssueFramePreviewUploadLinkUseCase {
  final FrameRepository _repository;

  IssueFramePreviewUploadLinkUseCase(this._repository);

  Future<UploadLinkResponseEntity> issueFramePreviewUploadLink(IssueUploadLinkRequestEntity request) async {
    return await _repository.issueFramePreviewUploadLink(request);
  }
}
