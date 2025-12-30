import 'package:potato_4cut_v2/data/common/models/request/issue_upload_link_request_model.dart';

class IssueUploadLinkRequestEntity {
  final String fileSize;

  const IssueUploadLinkRequestEntity(this.fileSize);

  IssueUploadLinkRequestModel toModel() {
    return IssueUploadLinkRequestModel(fileSize);
  }
}
