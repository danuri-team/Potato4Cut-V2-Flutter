import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photo_data_source.dart';
import 'package:potato_4cut_v2/features/take_photo/data/models/save_photos_response_model.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final Dio _dio;

  PhotoDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  final storage = FlutterSecureStorage();

  

  @override
  Future<SavePhotosResponseModel> savePhotos(List<File> images) async {
    final token = await storage.read(key: 'TOKEN');
    final List<MultipartFile> uploadFiles = [];

    for (File image in images) {
      uploadFiles.add(
        await MultipartFile.fromFile(
          image.path,
          filename: image.uri.pathSegments.last,
          contentType: MediaType("image", "jpeg"),
        ),
      );
    }

    final FormData formData = FormData.fromMap({"images": uploadFiles});

    final response = await _dio.post(
      "/api/v1/photos/cuts",
      data: formData,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    return SavePhotosResponseModel.fromJson(response.data);
  }

  @override
  Future save4CutPhotos(File composedImage, List<String> photoCutIds) async {
    final token = await storage.read(key: 'TOKEN');
    final MultipartFile composedImageField = await MultipartFile.fromFile(
      composedImage.path,
      filename: composedImage.uri.pathSegments.last,
      contentType: MediaType("image", "jpeg"),
    );
    final photoCutIdsField = MultipartFile.fromString(
      jsonEncode(photoCutIds),
      contentType: MediaType("application", "json"),
    );
    final formData = FormData.fromMap({
      'composedImage': composedImageField,
      'photoCutIds': photoCutIdsField,
    });

    await _dio.post(
      '/api/v1/photos',
      data: formData,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  @override
  Future importSpecificPhoto(String id) async {
    final token = await storage.read(key: 'TOKEN');
    final response = await _dio.get(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return response;
  }

  @override
  Future<void> deletePhoto(String id) async {
    final token = await storage.read(key: 'TOKEN');
    await _dio.delete(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
