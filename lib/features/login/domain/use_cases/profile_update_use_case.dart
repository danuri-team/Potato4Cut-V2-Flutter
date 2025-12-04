import 'dart:io';

import 'package:potato_4cut_v2/features/login/domain/repositories/auth_repository.dart';
import 'package:potato_4cut_v2/features/profile/domain/entities/get_my_info_entity.dart';

class ProfileUpdateUseCase {
  final AuthRepository _repository;

  const ProfileUpdateUseCase(this._repository);

  Future<MyInfoDataEntity> profileUpdate(
    String nickname,
    String? bio,
    String profilePresetId,
    File? profileImage,
  ) async {
    final response = await _repository.profileUpdate(
      nickname,
      bio,
      profilePresetId,
      profileImage,
    );
    
    return response;
  }
}
