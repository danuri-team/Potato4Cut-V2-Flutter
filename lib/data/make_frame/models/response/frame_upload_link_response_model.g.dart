// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_upload_link_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrameUploadLinkResponseModel _$FrameUploadLinkResponseModelFromJson(
  Map<String, dynamic> json,
) => FrameUploadLinkResponseModel(
  json['success'] as bool,
  FrameUploadLinkDataModel.fromJson(json['data'] as Map<String, dynamic>),
  json['message'] as String,
);

Map<String, dynamic> _$FrameUploadLinkResponseModelToJson(
  FrameUploadLinkResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};

FrameUploadLinkDataModel _$FrameUploadLinkDataModelFromJson(
  Map<String, dynamic> json,
) => FrameUploadLinkDataModel(
  json['uploadUrl'] as String,
  json['key'] as String,
  json['fileUrl'] as String,
  json['contentType'] as String,
  (json['maxFileSize'] as num).toInt(),
);

Map<String, dynamic> _$FrameUploadLinkDataModelToJson(
  FrameUploadLinkDataModel instance,
) => <String, dynamic>{
  'uploadUrl': instance.uploadUrl,
  'key': instance.key,
  'fileUrl': instance.fileUrl,
  'contentType': instance.contentType,
  'maxFileSize': instance.maxFileSize,
};
