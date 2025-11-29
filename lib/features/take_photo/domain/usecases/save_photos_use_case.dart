import 'dart:io';

import 'package:potato_4cut_v2/features/take_photo/domain/entities/save_photos_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/repositories/photo_repository.dart';

class SavePhotosUseCase {
  final PhotoRepository _repository;

  const SavePhotosUseCase(this._repository);

  Future<SavePhotosEntity> savePhotos(List<File> images) async{
    final response = await _repository.savePhotos(images);
    return response;
  }
}