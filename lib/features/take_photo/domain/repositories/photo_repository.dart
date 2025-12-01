import 'dart:io';

import 'package:potato_4cut_v2/features/take_photo/domain/entities/save_photos_entity.dart';

abstract class PhotoRepository {
  Future<SavePhotosEntity> savePhotos(List<File> images);

  Future save4CutPhotos(File composedImage, List<String> photoCutIds);

  Future importSpecificPhoto(String id);

  Future<void> deletePhoto(String id);
}