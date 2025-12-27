import 'package:potato_4cut_v2/domain/common/entities/response/success_response_entity.dart';
import 'package:potato_4cut_v2/domain/creator/repositories/creator_repository.dart';

class RegisterCreatorUseCase {
  final CreatorRepository _repository;

  const RegisterCreatorUseCase(this._repository);

  Future<SuccessResponseEntity> registerCreator() async {
    final response = await _repository.registerCreator();
    return response;
  }
}
