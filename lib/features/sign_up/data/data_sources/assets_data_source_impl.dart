import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/features/sign_up/data/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/features/sign_up/data/models/profile_preset_response_model.dart';

class AssetsDataSourceImpl implements AssetsDataSource {
  final Dio _dio;

  AssetsDataSourceImpl({Dio? dio}) : _dio = dio ?? AppDio.getInstance();

  final token =
      'eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJkNWY1ZDA2OC0wOTdmLTQzMDYtOWVjNi1kNzI1OTM5ZmM5NDUiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc2NDU4NTYyOCwiZXhwIjoxNzY0NTg5MjI4fQ.ZOyBAP62WoyDONoDeaCJESfAxAtyoHgUzoGlaMFLkhc1O-IMgBUr-WU46NotPi7e';

  @override
  Future<ProfilePresetResponseModel> getProfilePreset() async {
    final response = await _dio.get(
      '/api/v1/assets/profile',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return ProfilePresetResponseModel.fromJson(response.data);
  }
}
