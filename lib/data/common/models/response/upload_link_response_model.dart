import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/common/entities/response/upload_link_response_entity.dart';

part 'upload_link_response_model.g.dart';

@JsonSerializable()
class UploadLinkResponseModel {
  final bool success;
  final UploadLinkDataModel data;
  final String message;

  const UploadLinkResponseModel(this.success, this.data, this.message);

  factory UploadLinkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadLinkResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadLinkResponseModelToJson(this);

  UploadLinkResponseEntity toEntity() {
    final data = this.data.toEntity();
    return UploadLinkResponseEntity(success, data, message);
  }
}

@JsonSerializable()
class UploadLinkDataModel {
  final String uploadUrl;
  final String key;
  final String fileUrl;
  final String contentType;
  final int maxFileSize;

  const UploadLinkDataModel(
    this.uploadUrl,
    this.key,
    this.fileUrl,
    this.contentType,
    this.maxFileSize,
  );

  factory UploadLinkDataModel.fromJson(Map<String, dynamic> json) =>
      _$UploadLinkDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadLinkDataModelToJson(this);

  UploadLinkDataEntity toEntity(){
    return UploadLinkDataEntity(uploadUrl, key, fileUrl, contentType, maxFileSize);
  }
}
