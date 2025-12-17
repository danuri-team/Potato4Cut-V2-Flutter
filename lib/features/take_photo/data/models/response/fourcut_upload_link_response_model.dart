import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/response/fourcut_upload_link_response_entity.dart';

part 'fourcut_upload_link_response_model.g.dart';

@JsonSerializable()
class FourcutUploadLinkResponseModel {
  final bool success;
  final FourcutUploadLinkDataModel data;
  final String message;

  const FourcutUploadLinkResponseModel(this.success, this.data, this.message);

  factory FourcutUploadLinkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FourcutUploadLinkResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FourcutUploadLinkResponseModelToJson(this);

  FourcutUploadLinkResponseEntity toEntity() {
    final data = this.data.toEntity();
    return FourcutUploadLinkResponseEntity(success, data, message);
  }
}

@JsonSerializable()
class FourcutUploadLinkDataModel {
  final String uploadUrl;
  final String key;
  final String fileUrl;
  final String contentType;
  final int maxFileSize;

  const FourcutUploadLinkDataModel(
    this.uploadUrl,
    this.key,
    this.fileUrl,
    this.contentType,
    this.maxFileSize,
  );

  factory FourcutUploadLinkDataModel.fromJson(Map<String, dynamic> json) =>
      _$FourcutUploadLinkDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FourcutUploadLinkDataModelToJson(this);

  FourcutUploadLinkDataEntity toEntity(){
    return FourcutUploadLinkDataEntity(uploadUrl, key, fileUrl, contentType, maxFileSize);
  }
}
