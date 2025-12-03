import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/sign_up/data/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/features/sign_up/data/models/profile_preset_response_model.dart';

class AssetsDataSourceImpl implements AssetsDataSource {
  final Dio _dio;

  AssetsDataSourceImpl({required Dio dio}) : _dio = dio;

  final token = TokenStorage().getAccessToken();
  
  @override
  Future<ProfilePresetResponseModel> getProfilePreset() async {
    final response = await _dio.get(
      '/api/v1/assets/profile',
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );
    return ProfilePresetResponseModel.fromJson(response.data);
  }
}
