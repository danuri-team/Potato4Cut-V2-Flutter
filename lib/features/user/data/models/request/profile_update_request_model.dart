import 'package:json_annotation/json_annotation.dart';

part 'profile_update_request_model.g.dart';

@JsonSerializable()
class ProfileUpdateRequestModel {
  final String nickname;
  String? bio;
  final String profilePresetId;
  final String profileImageKey;

  ProfileUpdateRequestModel(
    this.nickname,
    this.bio,
    this.profilePresetId,
    this.profileImageKey,
  );

  factory ProfileUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUpdateRequestModelToJson(this);
}
