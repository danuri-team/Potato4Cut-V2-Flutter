import 'package:potato_4cut_v2/features/profile/domain/entities/get_my_info_entity.dart';
import 'package:potato_4cut_v2/features/profile/domain/repositories/profile_repository.dart';

class GetMyInfoUseCase {
  final ProfileRepository _repository;

  const GetMyInfoUseCase(this._repository);

  Future<GetMyInfoEntity> getMyInfo() async{
    final response = await _repository.getMyInfo();
    return response;
  }
}