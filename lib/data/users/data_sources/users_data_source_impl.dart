import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/data/users/models/request/profile_update_request_model.dart';
import 'package:potato_4cut_v2/data/users/data_sources/users_data_source.dart';
import 'package:potato_4cut_v2/data/users/models/request/login_request_model.dart';
import 'package:potato_4cut_v2/data/users/models/response/login_response_model.dart';
import 'package:potato_4cut_v2/data/users/models/response/my_info_response_model.dart';
import 'package:potato_4cut_v2/data/users/models/request/token_response_model.dart';

class UsersDataSourceImpl implements UsersDataSource {
  final Dio _dio;

  UsersDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  final _tokenStorage = TokenStorage();

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
    ProfileUpdateRequestModel request,
  ) async {
    final token = _tokenStorage.getAccessToken();

    final response = await _dio.put(
      '/api/v1/users/me',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );

    return MyInfoDataModel.fromJson(response.data);
  }

  @override
  Future<MyInfoResponseModel> getMyInfo() async {
    final token = _tokenStorage.getAccessToken();

    final response = await _dio.get(
      '/api/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );
    return MyInfoResponseModel.fromJson(response.data);
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
    final token = _tokenStorage.getAccessToken();

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
