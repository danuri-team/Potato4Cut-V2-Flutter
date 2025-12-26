import 'package:potato_4cut_v2/domain/make_frame/entities/request/issue_frame_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/frame_upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/repositories/frame_repository.dart';

class IssueFrameUploadLinkUseCase {
  final FrameRepository _repository;

  IssueFrameUploadLinkUseCase(this._repository);

  Future<FrameUploadLinkResponseEntity> execute(
    IssueFrameUploadLinkRequestEntity request,
  ) async {
    return await _repository.issueFrameUploadLink(request);
  }
}
