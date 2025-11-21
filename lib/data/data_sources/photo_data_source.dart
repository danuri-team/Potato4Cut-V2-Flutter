import 'dart:io';

import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';

class PhotosDataSource {
  final dio = AppDio.getInstance();

  Future savePhotos(List<File> images) async {
    final formData = FormData();
    for (var image in images) {
      formData.files.addAll([
        MapEntry('images', await MultipartFile.fromFile(image.path)),
      ]);
    }
    await dio.post(
      '/api/v1/photos/cuts',
      data: formData,
      options: Options(
        headers: {'Authorization': '', 'Content-Type': 'multipart/form-data'},
      ),
    );
  }

  Future save4CutPhotos(File composedImage, List<String> photoCutIds) async {
    final formData = FormData.fromMap({
      'composedImage': await MultipartFile.fromFile(composedImage.path),
    });
    for (String id in photoCutIds) {
      formData.files.addAll([
        MapEntry('photoCutIds', MultipartFile.fromString(id)),
      ]);
    }
    await dio.post(
      '/api/v1/photos',
      data: formData,
      options: Options(
        headers: {'Authorization': '', 'Content-Type': 'multipart/form-data'},
      ),
    );
  }

  Future getSpecificPhotos(String photoUuid) async {
    final response = await dio.get(
      '/api/v1/photos/$photoUuid',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future deetephoto(String photoUuid) async {
    await dio.delete(
      '/api/v1/photos/$photoUuid',
      options: Options(headers: {'Authorization': ''}),
    );
  }
}
