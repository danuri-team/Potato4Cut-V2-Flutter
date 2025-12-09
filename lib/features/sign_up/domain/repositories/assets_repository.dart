import 'package:potato_4cut_v2/features/sign_up/domain/entities/profile_preset_entity.dart';

abstract class AssetsRepository {
  Future<ProfilePresetEntity> getProfilePreset();
}