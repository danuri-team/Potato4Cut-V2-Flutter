import 'package:potato_4cut_v2/domain/users/repositories/users_repository.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/my_info_response_entity.dart';

class GetMyInfoUseCase {
  final UsersRepository _repository;

  const GetMyInfoUseCase(this._repository);

  Future<MyInfoResponseEntity> getMyInfo() async{
    final response = await _repository.getMyInfo();
    return response;
  }
}