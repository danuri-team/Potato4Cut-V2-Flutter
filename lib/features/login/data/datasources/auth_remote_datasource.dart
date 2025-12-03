import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/login/data/models/login_request_dto.dart';
import 'package:potato_4cut_v2/features/login/data/models/login_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto request);
  Future<LoginResponseDto> refreshToken(String refreshToken);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final token = TokenStorage().getAccessToken();

  @override
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    try {
      final response = await _dio.post(
        '/api/v1/auth/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponseDto.fromJson(response.data);
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
  Future<LoginResponseDto> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/api/v1/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponseDto.fromJson(response.data);
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
