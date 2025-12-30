import 'package:potato_4cut_v2/domain/common/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/common/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class IssueFrameLayerUploadLinkUseCase {
  final FrameRepository _repository;

  IssueFrameLayerUploadLinkUseCase(this._repository);

  Future<UploadLinkResponseEntity> issueFrameLayerUploadLink(IssueUploadLinkRequestEntity request) async {
    return await _repository.issueFrameLayerUploadLink(request);
  }
}
