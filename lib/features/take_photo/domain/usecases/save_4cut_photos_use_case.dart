
import 'dart:io';

import 'package:potato_4cut_v2/features/take_photo/domain/repositories/photo_repository.dart';

class Save4cutPhotosUseCase {
  final PhotoRepository _repository;

  Save4cutPhotosUseCase(this._repository);

  Future save4CutPhotos(File composedImage, List<String> photoCutIds) async{ 
    await _repository.save4CutPhotos(composedImage, photoCutIds);
  }
}