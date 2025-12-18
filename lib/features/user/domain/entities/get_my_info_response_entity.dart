import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/enum/user_type.dart';

class GetMyInfoResponseEntity {
  final bool success;
  final MyInfoDataEntity data;

  const GetMyInfoResponseEntity(this.success, this.data); 
}

class MyInfoDataEntity{
  final String userId;
  final String nickname;
  final AuthProviderType provider;
  final String email;
  String? profileImageUrl;
  String? bio;
  final UserType role;

  MyInfoDataEntity(
    this.userId,
    this.nickname,
    this.provider,
    this.email,
    this.profileImageUrl,
    this.bio,
    this.role,
  );
}