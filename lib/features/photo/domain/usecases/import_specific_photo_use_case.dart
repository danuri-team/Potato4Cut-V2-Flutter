import 'package:potato_4cut_v2/features/photo/domain/repositories/photo_repository.dart';

class ImportSpecificPhotoUseCase {
  final PhotoRepository _repository;

  ImportSpecificPhotoUseCase(this._repository);

  Future importSpecificPhoto(String id)async{
    final response = await _repository.importSpecificPhoto(id);
    return response;
  }
}