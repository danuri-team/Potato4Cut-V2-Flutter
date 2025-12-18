import 'package:potato_4cut_v2/features/assets/data/models/profile_preset_model.dart';

abstract class AssetsDataSource {
  Future<ProfilePresetModel> getProfilePreset();
}