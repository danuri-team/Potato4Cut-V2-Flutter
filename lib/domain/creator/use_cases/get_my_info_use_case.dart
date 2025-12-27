import 'package:potato_4cut_v2/domain/creator/entities/response/creator_info_response_entity.dart';
import 'package:potato_4cut_v2/domain/creator/repositories/creator_repository.dart';

class GetMyInfoUseCase {
  final CreatorRepository _repository;

  const GetMyInfoUseCase(this._repository);

  Future<CreatorInfoResponseEntity> getMyInfo() async {
    final response = await _repository.getMyInfo();
    return response;
  }
}
