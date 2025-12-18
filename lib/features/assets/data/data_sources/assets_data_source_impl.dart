import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/assets/data/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/features/assets/data/models/profile_preset_model.dart';

class AssetsDataSourceImpl implements AssetsDataSource {
  final Dio _dio;

  AssetsDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  final _tokenStorage = TokenStorage();
  
  @override
  Future<ProfilePresetModel> getProfilePreset() async {
    final response = await _dio.get(
      '/api/v1/assets/profile',
      options: Options(headers: {'Authorization': 'Bearer ${await _tokenStorage.getAccessToken()}'}),
    );
    return ProfilePresetModel.fromJson(response.data);
  }
}
