import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/features/library/data/data_sources/library_data_source.dart';
import 'package:potato_4cut_v2/features/library/data/models/response/possession_products_response_model.dart';

class LibraryDataSourceImpl implements LibraryDataSource {
  final Dio _dio;

  LibraryDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();


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
  Future addFrame(String frameId) async {
    final response = await _dio.post(
      '/api/v1/library/frames/$frameId',
      options: await _getOptions(),
    );
    return response;
  }

  @override
  Future<PossessionProductsResponseModel> getPossessionProducts(
    bool bookmarkedOnly,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  ) async {
    final response = await _dio.get(
      '/api/v1/library?/bookmarkedOnly=$bookmarkedOnly&page=$page&size=$size&sortBy=$sortBy&direction=$direction',
      options: await _getOptions(),
    );
    return PossessionProductsResponseModel.fromJson(response.data);
  }

  @override
  Future useFrame(String frameId) async {
    final response = await _dio.put(
      '/api/v1/library/frames/$frameId/use',
      options: await _getOptions(),
    );
    return response;
  }

  @override
  Future onoffBookmark(String frameId) async {
    final response = await _dio.put(
      '/api/v1/library/frames/$frameId/bookmak',
      options: await _getOptions(),
    );
    return response;
  }

  @override
  Future<void> deleteFrame(String frameId) async {
    await _dio.delete(
      '/api/v1/library/frames/$frameId',
      options: await _getOptions(),
    );
  }
}
