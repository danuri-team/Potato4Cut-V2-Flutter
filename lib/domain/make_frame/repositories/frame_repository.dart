import 'package:potato_4cut_v2/domain/make_frame/entities/request/create_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/request/issue_frame_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/create_frame_response_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/frame_upload_link_response_entity.dart';

abstract class FrameRepository {
  Future<FrameUploadLinkResponseEntity> issueFrameUploadLink(
    IssueFrameUploadLinkRequestEntity request,
  );

  Future<FrameUploadLinkResponseEntity> issuePreviewUploadLink(
    IssueFrameUploadLinkRequestEntity request,
  );

  Future<CreateFrameResponseEntity> createFrame(
    CreateFrameRequestEntity request,
  );

  Future<void> uploadFileToS3(String uploadUrl, List<int> fileBytes, String contentType);
}
