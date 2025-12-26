import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/request/issue_frame_upload_link_request_entity.dart';

part 'issue_frame_upload_link_request_model.g.dart';

@JsonSerializable()
class IssueFrameUploadLinkRequestModel {
  final String fileSize;

  const IssueFrameUploadLinkRequestModel(this.fileSize);

  factory IssueFrameUploadLinkRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IssueFrameUploadLinkRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IssueFrameUploadLinkRequestModelToJson(this);

  factory IssueFrameUploadLinkRequestModel.fromEntity(
      IssueFrameUploadLinkRequestEntity entity) {
    return IssueFrameUploadLinkRequestModel(entity.fileSize);
  }

  IssueFrameUploadLinkRequestEntity toEntity() {
    return IssueFrameUploadLinkRequestEntity(fileSize);
  }
}
