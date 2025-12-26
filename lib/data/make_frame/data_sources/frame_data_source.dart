import 'package:potato_4cut_v2/data/make_frame/models/request/create_frame_request_model.dart';
import 'package:potato_4cut_v2/data/make_frame/models/request/issue_frame_upload_link_request_model.dart';
import 'package:potato_4cut_v2/data/make_frame/models/response/create_frame_response_model.dart';
import 'package:potato_4cut_v2/data/make_frame/models/response/frame_upload_link_response_model.dart';

abstract class FrameDataSource {
  Future<FrameUploadLinkResponseModel> issueFrameUploadLink(
    IssueFrameUploadLinkRequestModel request,
  );

  Future<FrameUploadLinkResponseModel> issuePreviewUploadLink(
    IssueFrameUploadLinkRequestModel request,
  );

  Future<CreateFrameResponseModel> createFrame(
    CreateFrameRequestModel request,
  );

  Future<void> uploadFileToS3(String uploadUrl, List<int> fileBytes, String contentType);
}
