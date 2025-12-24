import 'package:potato_4cut_v2/data/assets/models/profile_preset_response_model.dart';

abstract class AssetsDataSource {
  Future<ProfilePresetResponseModel> getProfilePreset();
}