import 'package:potato_4cut_v2/domain/assets/entities/profile_preset_response_entity.dart';
import 'package:potato_4cut_v2/domain/assets/repositories/assets_repository.dart';

class GetProfilePresetUseCase {
  final AssetsRepository _repository;

  GetProfilePresetUseCase(this._repository);

  Future<ProfilePresetResponseEntity> getProfilePreset()async{
    final response = await _repository.getProfilePreset();
    return response;
  }
}