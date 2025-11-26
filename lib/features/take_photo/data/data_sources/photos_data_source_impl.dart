import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photos_data_source.dart';

class PhotosDataSourceImpl implements PhotosDataSource {
  final Dio _dio;

  PhotosDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();
  final token =
      "eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiI1ZTI4ZDI2OC1kM2E5LTRhMTEtYTUzYS1mMzY1ZGY5NzdiOGEiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc2NDE1NDI3NSwiZXhwIjoxNzY0MTU3ODc1fQ.tY0CkH8ZztvMzBqrPVn_bxv-NaJhg-g56CTgrvn_0qTK2xJPAElR60Fz850z4oWn";

  Future getMyInfo() async {
    final dio = AppDio.getInstance();
    await dio.get(
      '/api/v1/users/me',
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  @override
  Future savePhoto(File images) async {
    final bytes = await images.readAsBytes();
    final formData = FormData.fromMap({
      "images": MultipartFile.fromBytes(
        bytes,
        filename: images.uri.pathSegments.last,
        contentType: MediaType("image", "jpeg"),
      ),
    });

    // final formData = FormData.fromMap({
    //   "images": await MultipartFile.fromFile(
    //     images.path,
    //     filename: images.uri.pathSegments.last,
    //     contentType: MediaType("image", "jpeg"),
    //   ),
    // });

    try {
      final response = await _dio.post(
        "/api/v1/photos/cuts",
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      log('${e.response?.statusCode}, ${e.response?.data}');
    }
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
