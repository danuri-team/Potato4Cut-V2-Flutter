import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/enum/user_type.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/get_my_info_entity.dart';

part 'get_my_info_response_model.g.dart';

@JsonSerializable()
class GetMyInfoResponseModel {
  final bool success;
  final MyInfoDataModel data;

  const GetMyInfoResponseModel(this.success, this.data);

  factory GetMyInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyInfoResponseModelToJson(this);

  GetMyInfoEntity toEntity(){
    final data = this.data.toEntity();
    return GetMyInfoEntity(success, data);
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
