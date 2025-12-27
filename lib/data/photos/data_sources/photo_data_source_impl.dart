import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/data/common/models/request/issue_upload_link_request_model.dart';
import 'package:potato_4cut_v2/data/photos/data_sources/photo_data_source.dart';
import 'package:potato_4cut_v2/data/photos/models/request/save_4cut_photos_request_model.dart';
import 'package:potato_4cut_v2/data/common/models/response/upload_link_response_model.dart';
import 'package:potato_4cut_v2/data/photos/models/response/save_4cut_photos_response_model.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final Dio _dio;

  PhotoDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  final tokenStorage = TokenStorage();

  @override
  Future<Save4cutPhotosResponseModel> save4CutPhotos(Save4cutPhotosRequestModel request) async {
    final response = await _dio.post(
      '/api/v1/photos',
      data: request.toJson(),
      options: Options(headers: {"Authorization": "Bearer ${await tokenStorage.getAccessToken()}"}),
    );
    return Save4cutPhotosResponseModel.fromJson(response.data);
  }

  @override
  Future importSpecificPhoto(String id) async {
    final response = await _dio.get(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}'}),
    );

    return response;
  }

  @override
  Future<void> deletePhoto(String id) async {
    await _dio.delete(
      '/api/v1/photos/$id',
      options: Options(headers: {'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}'}),
    );
  }

  @override
  Future<UploadLinkResponseModel> issue4CutUploadLink(
    IssueUploadLinkRequestModel request,
  ) async {
    final response = await _dio.post(
      '/api/v1/photos/presigned-url',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}'}),
    );
    return UploadLinkResponseModel.fromJson(response.data);
  }
}
