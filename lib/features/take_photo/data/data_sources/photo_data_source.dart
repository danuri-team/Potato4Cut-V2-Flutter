import 'dart:io';

import 'package:potato_4cut_v2/features/take_photo/data/models/save_photos_response_model.dart';

abstract class PhotoDataSource {
  Future<SavePhotosResponseModel> savePhotos(List<File> images);

  Future save4CutPhotos(File composedImage, List<String> photoCutIds);

  Future importSpecificPhoto(String id);

  Future<void> deletePhoto(String id);
}
