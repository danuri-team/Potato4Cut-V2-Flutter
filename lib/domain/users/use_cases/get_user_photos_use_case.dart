import 'package:potato_4cut_v2/domain/users/repositories/users_repository.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/user_photos_response_entity.dart';

class GetUserPhotosUseCase {
  final UsersRepository _repository;

  const GetUserPhotosUseCase(this._repository);

  Future<UserPhotosResponseEntity> getUserPhotos(int page, int size) async {
    final response = await _repository.getUserPhotos(page, size);
    return response;
  }
}
