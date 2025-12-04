import 'dart:io';

import 'package:potato_4cut_v2/features/login/domain/entities/auth_result_entity.dart';

abstract class AuthRepository {
  Future<AuthResultEntity> login({
    required String provider,
    required String token,
    required String deviceToken,
  });

  Future profileUpdate(
    String nickname,
    String? bio,
    String profilePresetId,
    File? profileImage,
  );

  Future<AuthResultEntity> refreshToken(String refreshToken);

  Future<void> logout();
}
