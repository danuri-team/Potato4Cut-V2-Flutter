// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_frame_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFrameRequestModel _$CreateFrameRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateFrameRequestModel(
  title: json['title'] as String,
  description: json['description'] as String,
  isPublic: json['isPublic'] as bool,
  price: (json['price'] as num).toInt(),
  frameBaseImageKey: json['frameBaseImageKey'] as String,
  frameOverlayImageKey: json['frameOverlayImageKey'] as String?,
  previewImageKey: json['previewImageKey'] as String,
  category: json['category'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CreateFrameRequestModelToJson(
  CreateFrameRequestModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'isPublic': instance.isPublic,
  'price': instance.price,
  'frameBaseImageKey': instance.frameBaseImageKey,
  'frameOverlayImageKey': instance.frameOverlayImageKey,
  'previewImageKey': instance.previewImageKey,
  'category': instance.category,
  'tags': instance.tags,
};
