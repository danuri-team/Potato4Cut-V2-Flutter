import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/enum/direction_type.dart';

class LibraryDataSource {
  final dio = AppDio.getInstance();

  Future addFrame(String frameUuid) async {
    await dio.post(
      '/api/v1/frames/$frameUuid',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future getOwnedProducts(
    bool bookmarkedOnly,
    int page,
    int size,
    var sortBy,
    DirectionType direction
  ) async {
    final response = await dio.get(
      '/api/v1/library?bookmarkedOnly=$bookmarkedOnly&page=$page&size=$size&sortBy=$sortBy&direction=$direction',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future useFrame(String frameUuid) async {
    await dio.put(
      '/api/v1/library/frames/$frameUuid/use',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future onOffFrameBookMark(String frameUuid) async {
    await dio.put(
      '/api/v1/library/frames/$frameUuid/bookmak',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future deleteFrame(String frameUuid) async {
    await dio.delete(
      '/api/v1/library/frames/$frameUuid',
      options: Options(headers: {'Authorization': ''}),
    );
  }
}
