import 'package:potato_4cut_v2/domain/assets/entities/profile_preset_response_entity.dart';

abstract class AssetsRepository {
  Future<ProfilePresetResponseEntity> getProfilePreset();
}