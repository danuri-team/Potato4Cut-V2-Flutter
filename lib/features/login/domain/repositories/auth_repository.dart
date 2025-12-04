import 'dart:io';

import 'package:potato_4cut_v2/features/login/domain/entities/auth_result_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/login_result_entity.dart';
import 'package:potato_4cut_v2/features/profile/domain/entities/get_my_info_entity.dart';

abstract class AuthRepository {
  Future<AuthResultEntity> login({
    required String provider,
    required String token,
    required String deviceToken,
  });

  Future<MyInfoDataEntity> profileUpdate(
    String nickname,
    String? bio,
    String profilePresetId,
    File? profileImage,
  );

  Future<TokenEntity> refreshToken(String refreshToken);

  Future<void> logout();
}
