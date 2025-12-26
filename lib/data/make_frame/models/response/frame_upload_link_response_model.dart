import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/frame_upload_link_response_entity.dart';

part 'frame_upload_link_response_model.g.dart';

@JsonSerializable()
class FrameUploadLinkResponseModel {
  final bool success;
  final FrameUploadLinkDataModel data;
  final String message;

  const FrameUploadLinkResponseModel(this.success, this.data, this.message);

  factory FrameUploadLinkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FrameUploadLinkResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrameUploadLinkResponseModelToJson(this);

  FrameUploadLinkResponseEntity toEntity() {
    return FrameUploadLinkResponseEntity(success, data.toEntity(), message);
  }
}

@JsonSerializable()
class FrameUploadLinkDataModel {
  final String uploadUrl;
  final String key;
  final String fileUrl;
  final String contentType;
  final int maxFileSize;

  const FrameUploadLinkDataModel(
    this.uploadUrl,
    this.key,
    this.fileUrl,
    this.contentType,
    this.maxFileSize,
  );

  factory FrameUploadLinkDataModel.fromJson(Map<String, dynamic> json) =>
      _$FrameUploadLinkDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrameUploadLinkDataModelToJson(this);

  FrameUploadLinkDataEntity toEntity() {
    return FrameUploadLinkDataEntity(
      uploadUrl,
      key,
      fileUrl,
      contentType,
      maxFileSize,
    );
  }
}
