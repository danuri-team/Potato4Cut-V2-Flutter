import 'dart:io';

abstract class PhotoRepository {
  Future savePhotos(List<File> images);

  Future save4CutPhotos(File composedImage, List<String> photoCutIds);

  Future getSpecificPhotos(String photoUuid);

  Future deetephoto(String photoUuid);
}