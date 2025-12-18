// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_preset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePresetModel _$ProfilePresetModelFromJson(Map<String, dynamic> json) =>
    ProfilePresetModel(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map(
            (e) => ProfilePresetDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$ProfilePresetModelToJson(ProfilePresetModel instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

ProfilePresetDataModel _$ProfilePresetDataModelFromJson(
  Map<String, dynamic> json,
) => ProfilePresetDataModel(
  id: json['id'] as String,
  title: json['title'] as String,
  imgUrl: json['imgUrl'] as String,
);

Map<String, dynamic> _$ProfilePresetDataModelToJson(
  ProfilePresetDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'imgUrl': instance.imgUrl,
};
