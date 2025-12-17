// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_4cut_photos_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Save4cutPhotosResponseModel _$Save4cutPhotosResponseModelFromJson(
  Map<String, dynamic> json,
) => Save4cutPhotosResponseModel(
  json['success'] as bool,
  Save4cutPhotosDataModel.fromJson(json['data'] as Map<String, dynamic>),
  json['message'] as String,
);

Map<String, dynamic> _$Save4cutPhotosResponseModelToJson(
  Save4cutPhotosResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};

Save4cutPhotosDataModel _$Save4cutPhotosDataModelFromJson(
  Map<String, dynamic> json,
) => Save4cutPhotosDataModel(
  json['photoId'] as String,
  json['composedImageUrl'] as String,
  json['frameId'] as String?,
  json['frameTitle'] as String?,
);

Map<String, dynamic> _$Save4cutPhotosDataModelToJson(
  Save4cutPhotosDataModel instance,
) => <String, dynamic>{
  'photoId': instance.photoId,
  'composedImageUrl': instance.composedImageUrl,
  'frameId': instance.frameId,
  'frameTitle': instance.frameTitle,
};
