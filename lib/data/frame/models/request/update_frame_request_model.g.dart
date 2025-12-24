// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_frame_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFrameRequestModel _$UpdateFrameRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateFrameRequestModel(
  json['frameBaseImageKey'] as String,
  json['frameOverlayImageKey'] as String,
);

Map<String, dynamic> _$UpdateFrameRequestModelToJson(
  UpdateFrameRequestModel instance,
) => <String, dynamic>{
  'frameBaseImageKey': instance.frameBaseImageKey,
  'frameOverlayImageKey': instance.frameOverlayImageKey,
};
