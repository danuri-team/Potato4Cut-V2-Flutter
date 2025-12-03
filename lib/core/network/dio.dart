import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/login/provider/auth_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  return _AppDio(ref);
});

class _AppDio with DioMixin implements Dio {
  final Ref _ref;

  _AppDio(this._ref) {
    httpClientAdapter = IOHttpClientAdapter();
    options = BaseOptions(
      baseUrl: dotenv.env['apiBaseUrl']!,
      headers: {
        'Content-Type': 'application/json',
      },
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
              await _ref.read(authProvider.notifier).refreshToken();
              final accessToken = await TokenStorage().getAccessToken();
              final option = error.requestOptions;
              option.headers.addAll({'Authorization': 'Bearer $accessToken'});
              
              final response = await fetch(error.requestOptions);
              return handler.resolve(response);
          }
          return handler.reject(error);
        },
      ),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }
}
