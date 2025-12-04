import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/login/data/datasources/auth_remote_datasource.dart';

abstract class AppDio {
  AppDio._internal();

  static Dio? _instance;

  static Dio getInstance() => _instance ?? _AppDio();
}

class _AppDio with DioMixin implements Dio {
  _AppDio() {
    httpClientAdapter = IOHttpClientAdapter();
    options = BaseOptions(
      baseUrl: dotenv.env['apiBaseUrl']!,
      headers: {'Content-Type': 'application/json'},
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
    );

    interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 403) {
            final tokenStorage = TokenStorage();
            final refreshToken = await tokenStorage.getRefreshToken();
            if (refreshToken != null) {
              final response = await AuthRemoteDataSourceImpl(
                null,
              ).refreshToken(refreshToken);
              tokenStorage.setAccessAndRefreshToken(
                response.accessToken,
                response.refreshToken,
              );

              final options = error.requestOptions;
              options.headers.addAll({'Authorization': 'Bearer ${response.accessToken}'});
              final api = await fetch(options);
              return handler.resolve(api);
            }
          }
          return handler.reject(error);
        },
      ),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }
}
