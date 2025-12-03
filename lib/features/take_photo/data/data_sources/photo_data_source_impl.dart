import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photo_data_source.dart';
import 'package:potato_4cut_v2/features/take_photo/data/models/save_photos_response_model.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final Dio _dio;

  PhotoDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  final token = TokenStorage().getAccessToken();

  

  @override
  Future<SavePhotosResponseModel> savePhotos(List<File> images) async {
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
      options: Options(headers: {"Authorization": "Bearer ${await token}"}),
    );

    return SavePhotosResponseModel.fromJson(response.data);
  }

  @override
  Future save4CutPhotos(File composedImage, List<String> photoCutIds) async {
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
      options: Options(headers: {"Authorization": "Bearer ${await token}"}),
    );
  }

  @override
  Future importSpecificPhoto(String id) async {
    final response = await _dio.get(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );

    return response;
  }

  @override
  Future<void> deletePhoto(String id) async {
    await _dio.delete(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );
  }
}
