import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';

class CreatorDataSource {
  final dio = AppDio.getInstance();

  Future creatorApplication() async {
    await dio.post(
      '/api/v1/creators/apply',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future getPersonnelInfo() async {
    final response = await dio.get(
      '/api/v1/creators/me',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }
}
