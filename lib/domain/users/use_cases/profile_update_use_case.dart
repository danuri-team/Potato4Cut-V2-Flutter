import 'package:potato_4cut_v2/domain/users/entities/request/profile_update_request_entity.dart';
import 'package:potato_4cut_v2/domain/users/repositories/users_repository.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/my_info_response_entity.dart';

class ProfileUpdateUseCase {
  final UsersRepository _repository;

  const ProfileUpdateUseCase(this._repository);

  Future<MyInfoDataEntity> profileUpdate(
    ProfileUpdateRequestEntity request,
  ) async {
    final response = await _repository.profileUpdate(request);

    return response;
  }
}
