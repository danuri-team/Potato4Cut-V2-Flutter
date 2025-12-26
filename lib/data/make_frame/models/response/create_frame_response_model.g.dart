// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_frame_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFrameResponseModel _$CreateFrameResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateFrameResponseModel(
  json['success'] as bool,
  CreateFrameDataModel.fromJson(json['data'] as Map<String, dynamic>),
  json['message'] as String,
);

Map<String, dynamic> _$CreateFrameResponseModelToJson(
  CreateFrameResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};

CreateFrameDataModel _$CreateFrameDataModelFromJson(
  Map<String, dynamic> json,
) => CreateFrameDataModel(
  frameId: json['frameId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  public: json['public'] as bool,
  price: (json['price'] as num).toInt(),
  frameBaseImageUrl: json['frameBaseImageUrl'] as String,
  frameOverlayImageUrl: json['frameOverlayImageUrl'] as String?,
  previewImageUrl: json['previewImageUrl'] as String,
  category: json['category'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CreateFrameDataModelToJson(
  CreateFrameDataModel instance,
) => <String, dynamic>{
  'frameId': instance.frameId,
  'title': instance.title,
  'description': instance.description,
  'public': instance.public,
  'price': instance.price,
  'frameBaseImageUrl': instance.frameBaseImageUrl,
  'frameOverlayImageUrl': instance.frameOverlayImageUrl,
  'previewImageUrl': instance.previewImageUrl,
  'category': instance.category,
  'tags': instance.tags,
};
