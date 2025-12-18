import 'package:potato_4cut_v2/features/user/domain/entities/response/profile_preset_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/repositories/users_repository.dart';

class GetProfilePresetUseCase {
  final UsersRepository _repository;

  GetProfilePresetUseCase(this._repository);

  Future<ProfilePresetResponseEntity> getProfilePreset()async{
    final response = await _repository.getProfilePreset();
    return response;
  }
}