import 'package:potato_4cut_v2/domain/photos/repositories/photo_repository.dart';

class DeletePhotoUseCase {
  final PhotoRepository _repository;

  DeletePhotoUseCase(this._repository);

  Future<void> deletePhoto(String id) async{
    await _repository.deletePhoto(id);
  }
}