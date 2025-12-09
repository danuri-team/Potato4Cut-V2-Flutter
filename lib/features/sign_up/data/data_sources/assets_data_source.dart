import 'package:potato_4cut_v2/features/sign_up/data/models/profile_preset_response_model.dart';

abstract class AssetsDataSource {
  Future<ProfilePresetResponseModel> getProfilePreset();
}