import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';

class TagsDataSource {
  final dio = AppDio.getInstance();

  Future getPopularTags() async {
    final response = await dio.get(
      '/api/v1/tags/popular',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }
}
