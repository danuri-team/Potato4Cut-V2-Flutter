// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fourcut_upload_link_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FourcutUploadLinkResponseModel _$FourcutUploadLinkResponseModelFromJson(
  Map<String, dynamic> json,
) => FourcutUploadLinkResponseModel(
  json['success'] as bool,
  FourcutUploadLinkDataModel.fromJson(json['data'] as Map<String, dynamic>),
  json['message'] as String,
);

Map<String, dynamic> _$FourcutUploadLinkResponseModelToJson(
  FourcutUploadLinkResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};

FourcutUploadLinkDataModel _$FourcutUploadLinkDataModelFromJson(
  Map<String, dynamic> json,
) => FourcutUploadLinkDataModel(
  json['uploadUrl'] as String,
  json['key'] as String,
  json['fileUrl'] as String,
  json['contentType'] as String,
  (json['maxFileSize'] as num).toInt(),
);

Map<String, dynamic> _$FourcutUploadLinkDataModelToJson(
  FourcutUploadLinkDataModel instance,
) => <String, dynamic>{
  'uploadUrl': instance.uploadUrl,
  'key': instance.key,
  'fileUrl': instance.fileUrl,
  'contentType': instance.contentType,
  'maxFileSize': instance.maxFileSize,
};
