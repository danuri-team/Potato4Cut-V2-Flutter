import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/common/entities/request/issue_upload_link_request_entity.dart';

part 'issue_upload_link_request_model.g.dart';

@JsonSerializable()
class IssueUploadLinkRequestModel {
  final String fileSize;

  const IssueUploadLinkRequestModel(this.fileSize);

  factory IssueUploadLinkRequestModel.fromJson(Map<String, dynamic> json) => _$IssueUploadLinkRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueUploadLinkRequestModelToJson(this);

  IssueUploadLinkRequestEntity toEntity(){
    return IssueUploadLinkRequestEntity(fileSize);
  }
}
