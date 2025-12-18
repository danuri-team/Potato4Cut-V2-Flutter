import 'package:potato_4cut_v2/features/user/domain/repositories/users_repository.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/get_my_info_response_entity.dart';

class GetMyInfoUseCase {
  final UsersRepository _repository;

  const GetMyInfoUseCase(this._repository);

  Future<GetMyInfoResponseEntity> getMyInfo() async{
    final response = await _repository.getMyInfo();
    return response;
  }
}