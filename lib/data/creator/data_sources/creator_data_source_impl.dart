import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/data/common/models/response/success_response_model.dart';
import 'package:potato_4cut_v2/data/creator/data_sources/creator_data_source.dart';
import 'package:potato_4cut_v2/data/creator/models/response/creator_info_response_model.dart';

class CreatorDataSourceImpl implements CreatorDataSource {
  final Dio _dio;

  CreatorDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  Future<Options> _getOptions({String? contentType}) async {
    final tokenStorage = TokenStorage();
    return Options(
      headers: {
        'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}',
      },
      contentType: contentType,
    );
  }

  @override
  Future<SuccessResponseModel> registerCreator() async {
      final response = await _dio.post(
        '/api/v1/creators/apply',
        options: await _getOptions(),
      );
      return SuccessResponseModel.fromJson(response.data);
  }

  @override
  Future<CreatorInfoResponseModel> getMyInfo() async {
    final response = await _dio.get(
      '/api/v1/creators/me',
      options: await _getOptions(),
    );
    return CreatorInfoResponseModel.fromJson(response.data);
  }
}
