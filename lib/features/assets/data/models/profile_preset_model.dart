import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/assets/domain/entities/profile_preset_entity.dart';

part 'profile_preset_model.g.dart';

@JsonSerializable()
class ProfilePresetModel {
  final bool success;
  final List<ProfilePresetDataModel> data;

  const ProfilePresetModel({required this.success, required this.data});

  factory ProfilePresetModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePresetModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePresetModelToJson(this);

  ProfilePresetEntity toEntity(){
    final List<ProfilePresetDataEntity> data  = [];
    for(var profilePresetResponseModel in this.data){
      data.add(profilePresetResponseModel.toEntity());
    }
    return ProfilePresetEntity(success: success, data: data);
  }
}

@JsonSerializable()
class ProfilePresetDataModel {
  final String id;
  final String title;
  final String imgUrl;

  const ProfilePresetDataModel({
    required this.id,
    required this.title,
    required this.imgUrl,
  });

  factory ProfilePresetDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePresetDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePresetDataModelToJson(this);

  ProfilePresetDataEntity toEntity(){
    return ProfilePresetDataEntity(id: id, title: title, imgUrl: imgUrl);
  }
}
