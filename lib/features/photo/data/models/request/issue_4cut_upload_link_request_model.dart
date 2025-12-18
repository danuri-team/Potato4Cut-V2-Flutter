import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/photo/domain/entites/request/issue_4cut_upload_link_request_entity.dart';

part 'issue_4cut_upload_link_request_model.g.dart';

@JsonSerializable()
class Issue4cutUploadLinkRequestModel {
  final String fileSize;

  const Issue4cutUploadLinkRequestModel(this.fileSize);

  factory Issue4cutUploadLinkRequestModel.fromJson(Map<String, dynamic> json) =>
      _$Issue4cutUploadLinkRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$Issue4cutUploadLinkRequestModelToJson(this);

  Issue4cutUploadLinkRequestEntity toEntity(){
    return Issue4cutUploadLinkRequestEntity(fileSize);
  }
}
