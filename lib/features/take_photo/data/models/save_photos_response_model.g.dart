// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_photos_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavePhotosResponseModel _$SavePhotosResponseModelFromJson(
  Map<String, dynamic> json,
) => SavePhotosResponseModel(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>)
      .map((e) => PhotoDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String,
);

Map<String, dynamic> _$SavePhotosResponseModelToJson(
  SavePhotosResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};

PhotoDataModel _$PhotoDataModelFromJson(Map<String, dynamic> json) =>
    PhotoDataModel(
      cutId: json['cutId'] as String,
      cutOrder: (json['cutOrder'] as num).toInt(),
      originalImageUrl: json['originalImageUrl'] as String,
    );

Map<String, dynamic> _$PhotoDataModelToJson(PhotoDataModel instance) =>
    <String, dynamic>{
      'cutId': instance.cutId,
      'cutOrder': instance.cutOrder,
      'originalImageUrl': instance.originalImageUrl,
    };
