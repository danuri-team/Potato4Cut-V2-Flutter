
import 'package:potato_4cut_v2/domain/photos/entites/request/save_4cut_photos_request_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/response/save_4cut_photos_response_entity.dart';
import 'package:potato_4cut_v2/domain/photos/repositories/photo_repository.dart';

class Save4cutPhotosUseCase {
  final PhotoRepository _repository;

  Save4cutPhotosUseCase(this._repository);

  Future<Save4cutPhotosResponseEntity> save4CutPhotos(Save4cutPhotosRequestEntity request) async{ 
    final response = await _repository.save4CutPhotos(request);
    return response;
  }
}