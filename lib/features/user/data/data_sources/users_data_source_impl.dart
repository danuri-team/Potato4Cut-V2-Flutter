import 'dart:io';

import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/user/data/data_sources/users_data_source.dart';
import 'package:potato_4cut_v2/features/user/data/models/login_request_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/login_response_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:potato_4cut_v2/features/user/data/models/get_my_info_response_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/token_response_model.dart';

class UsersDataSourceImpl implements UsersDataSource {
  final Dio _dio;

  UsersDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  final tokenStorage = TokenStorage();

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _dio.post(
        '/api/v1/auth/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Login failed with status code: ${response.statusCode}',
        );
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error during login: $e');
    }
  }

  @override
  Future<MyInfoDataModel> profileUpdate(
    String nickname,
    String? bio,
    String profilePresetId,
    File? profileImage,
  ) async {
    final dataMap = {};

    final formNickname = MultipartFile.fromString(
      nickname,
      contentType: MediaType("application", "json"),
    );
    dataMap['nickname'] = formNickname;

    if (bio != null) {
      final formBio = MultipartFile.fromString(
        bio,
        contentType: MediaType("application", "json"),
      );
      dataMap['bio'] = formBio;
    }

    final formProfilePresetId = MultipartFile.fromString(
      profilePresetId,
      contentType: MediaType("application", "json"),
    );
    dataMap['profilePresetId'] = formProfilePresetId;

    final formData = FormData.fromMap({
      'data': dataMap,
    });

    if (profileImage != null) {
      final fromProfileImage = await MultipartFile.fromFile(
        profileImage.path,
        filename: profileImage.uri.pathSegments.last,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('profileImage', fromProfileImage));
    }

    final token = tokenStorage.getAccessToken();

    final response = await _dio.put(
      '/api/v1/users/me',
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );

    return MyInfoDataModel.fromJson(response.data);
  }

  @override
  Future<GetMyInfoResponseModel> getMyInfo() async {
    final token = tokenStorage.getAccessToken();

    final response = await _dio.get(
      '/api/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );
    return GetMyInfoResponseModel.fromJson(response.data);
  }

  @override
  Future<TokenModel> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/api/v1/auth/refresh',
        data: {"refreshToken": refreshToken},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TokenModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error:
              'Token refresh failed with status code: ${response.statusCode}',
        );
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error during token refresh: $e');
    }
  }

  @override
  Future<void> logout() async {
    final token = tokenStorage.getAccessToken();

    try {
      final response = await _dio.post(
        '/api/v1/auth/logout',
        options: Options(headers: {'Authrization': 'Bearer ${await token}'}),
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Logout failed with status code: ${response.statusCode}',
        );
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error during logout: $e');
    }
  }
}
