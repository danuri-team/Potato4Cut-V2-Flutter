import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/profile/data/data_sources/profile_data_source.dart';
import 'package:potato_4cut_v2/features/profile/data/models/get_my_info_response_model.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final Dio _dio;

  ProfileDataSourceImpl({required Dio dio}) : _dio = dio;

  final token = TokenStorage().getAccessToken();

  @override
  Future<GetMyInfoResponseModel> getMyInfo() async {

    final response = await _dio.get(
      '/api/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer ${await token}'}),
    );
    return GetMyInfoResponseModel.fromJson(response.data);
  }
}
