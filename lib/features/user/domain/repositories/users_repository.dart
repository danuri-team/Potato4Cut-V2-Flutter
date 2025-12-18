import 'dart:io';

import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/profile_preset_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/login_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/get_my_info_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/token_response_entity.dart';

abstract class UsersRepository {
  Future<LoginResponseEntity> login({
    required AuthProviderType provider,
    required String token,
    required String deviceToken,
  });

  Future<MyInfoDataEntity> profileUpdate(
    String nickname,
    String? bio,
    String profilePresetId,
    File? profileImage,
  );

  Future<GetMyInfoResponseEntity> getMyInfo();

  Future<TokenResponseEntity> refreshToken(String refreshToken);

  Future<void> logout();

  Future<ProfilePresetEntity> getProfilePreset();
}
