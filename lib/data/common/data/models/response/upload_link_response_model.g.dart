// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_link_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadLinkResponseModel _$UploadLinkResponseModelFromJson(
  Map<String, dynamic> json,
) => UploadLinkResponseModel(
  json['success'] as bool,
  UploadLinkDataModel.fromJson(json['data'] as Map<String, dynamic>),
  json['message'] as String,
);

Map<String, dynamic> _$UploadLinkResponseModelToJson(
  UploadLinkResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};

UploadLinkDataModel _$UploadLinkDataModelFromJson(Map<String, dynamic> json) =>
    UploadLinkDataModel(
      json['uploadUrl'] as String,
      json['key'] as String,
      json['fileUrl'] as String,
      json['contentType'] as String,
      (json['maxFileSize'] as num).toInt(),
    );

Map<String, dynamic> _$UploadLinkDataModelToJson(
  UploadLinkDataModel instance,
) => <String, dynamic>{
  'uploadUrl': instance.uploadUrl,
  'key': instance.key,
  'fileUrl': instance.fileUrl,
  'contentType': instance.contentType,
  'maxFileSize': instance.maxFileSize,
};
