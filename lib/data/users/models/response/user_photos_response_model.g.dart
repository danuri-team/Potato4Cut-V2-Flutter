// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_photos_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPhotosResponseModel _$UserPhotosResponseModelFromJson(
  Map<String, dynamic> json,
) => UserPhotosResponseModel(
  json['success'] as bool,
  UserPhotosDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserPhotosResponseModelToJson(
  UserPhotosResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

UserPhotosDataModel _$UserPhotosDataModelFromJson(Map<String, dynamic> json) =>
    UserPhotosDataModel(
      (json['content'] as List<dynamic>)
          .map((e) => UserPhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['currentPage'] as num).toInt(),
      (json['pageSize'] as num).toInt(),
      (json['totalElements'] as num).toInt(),
      (json['totalPages'] as num).toInt(),
      json['first'] as bool,
      json['last'] as bool,
      json['hasNext'] as bool,
      json['hasPrevious'] as bool,
    );

Map<String, dynamic> _$UserPhotosDataModelToJson(
  UserPhotosDataModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'currentPage': instance.currentPage,
  'pageSize': instance.pageSize,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};

UserPhotoModel _$UserPhotoModelFromJson(Map<String, dynamic> json) =>
    UserPhotoModel(
      json['photoId'] as String,
      json['imageUrl'] as String,
      json['frameId'] as String,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserPhotoModelToJson(UserPhotoModel instance) =>
    <String, dynamic>{
      'photoId': instance.photoId,
      'imageUrl': instance.imageUrl,
      'frameId': instance.frameId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
