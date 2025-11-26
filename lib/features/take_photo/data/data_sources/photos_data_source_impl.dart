import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photos_data_source.dart';

class PhotosDataSourceImpl implements PhotosDataSource {
  final Dio _dio;

  PhotosDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  @override
  Future savePhoto(File images) async {
    final formData = FormData.fromMap({
      'images': await MultipartFile.fromFile(
        images.path,
        filename: images.uri.pathSegments.last,
      ),
    });
    final response = await _dio.post(
      '/api/v1/photos/cuts',
      data: formData,
      options: Options(
        headers: {
          // 'Content-Type': 'multipart/form-data',
          'Authorization':
              'Bearer eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiI4OTJhYzcwNS1jYjY5LTRjNjktOTVlNC1lYmI4ZDBlZWZkNWEiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc2NDAzNjAwOCwiZXhwIjoxNzY0MDM5NjA4fQ.GJUWPy0-9XAhPuTbsyAvYS3oNYh_5yJKpdAu81hAB-x2T-IcT2pd_-1qqtLAoIAG',
        },
      ),
    );
    log('response = $response');
  }

  @override
  Future save4CutPhotos(File composedImage, List<String> photoCutIds) async {
    final formData = FormData.fromMap({
      'composedImage': composedImage,
      'photoCutIds': List.generate(photoCutIds.length, (index) async {
        await MultipartFile.fromFile(photoCutIds[index]);
      }),
    });
    final response = await _dio.post(
      '/api/v1/photos',
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'token',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
  }

  @override
  Future importSpecificPhotos(String id) async {
    final response = await _dio.get(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'token'}),
    );
  }

  @override
  Future<void> deletePhoto(String id) async {
    await _dio.delete(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'token'}),
    );
  }
}
