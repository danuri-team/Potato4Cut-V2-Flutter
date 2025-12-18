import 'package:potato_4cut_v2/features/assets/domain/entities/profile_preset_entity.dart';
import 'package:potato_4cut_v2/features/assets/domain/repositories/assets_repository.dart';

class GetProfilePreset {
  final AssetsRepository _repository;

  GetProfilePreset(this._repository);

  Future<ProfilePresetEntity> getProfilePreset()async{
    final response = await _repository.getProfilePreset();
    return response;
  }
}