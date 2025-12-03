import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/features/profile/data/data_sources/profile_data_source.dart';
import 'package:potato_4cut_v2/features/profile/data/models/get_my_info_response_model.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final Dio _dio;

  ProfileDataSourceImpl({Dio? dio}) : _dio = dio ?? AppDio.getInstance();

  final token = 'eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiIwZTVmN2YwNS1lYjQwLTQ4MTAtYTgzMC1kZmY1OWJiNWRjYjYiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc2NDcxOTYwNCwiZXhwIjoxNzY0NzIzMjA0fQ.y_CP6GEqH2P4EaLIebZAGCyHRAivvZaJG1pMBgAo1fDp5-avfI6CxyBIOFG1QHT0';

  @override
  Future<GetMyInfoResponseModel> getMyInfo() async {
    final response = await _dio.get(
      '/api/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return GetMyInfoResponseModel.fromJson(response.data);
  }
}
