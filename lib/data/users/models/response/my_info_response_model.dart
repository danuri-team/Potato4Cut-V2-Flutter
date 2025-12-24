import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/enum/user_type.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/my_info_response_entity.dart';

part 'my_info_response_model.g.dart';

@JsonSerializable()
class MyInfoResponseModel {
  final bool success;
  final MyInfoDataModel data;

  const MyInfoResponseModel(this.success, this.data);

  factory MyInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MyInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyInfoResponseModelToJson(this);

  MyInfoResponseEntity toEntity(){
    final data = this.data.toEntity();
    return MyInfoResponseEntity(success, data);
  }
}

@JsonSerializable()
class MyInfoDataModel {
  final String userId;
  final String nickname;
  final AuthProviderType provider;
  final String email;
  String? profileImageUrl;
  String? bio;
  final UserType role;

  MyInfoDataModel(
    this.userId,
    this.nickname,
    this.provider,
    this.email,
    this.profileImageUrl,
    this.bio,
    this.role,
  );

  factory MyInfoDataModel.fromJson(Map<String, dynamic> json) =>
      _$MyInfoDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyInfoDataModelToJson(this);

  MyInfoDataEntity toEntity(){
    return MyInfoDataEntity(userId, nickname, provider, email, profileImageUrl, bio, role);
  }
}
