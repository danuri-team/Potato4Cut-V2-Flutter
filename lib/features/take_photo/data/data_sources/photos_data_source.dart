import 'dart:io';

abstract class PhotosDataSource {
  Future savePhoto(File images);

  Future save4CutPhotos(File composedImage, List<String> photoCutIds);

  Future importSpecificPhotos(String id);

  Future<void> deletePhoto(String id);
}
