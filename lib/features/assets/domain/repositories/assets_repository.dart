import 'package:potato_4cut_v2/features/assets/domain/entities/profile_preset_entity.dart';

abstract class AssetsRepository {
  Future<ProfilePresetEntity> getProfilePreset();
}