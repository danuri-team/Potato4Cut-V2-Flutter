import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/features/library/data/data_sources/library_data_source.dart';
import 'package:potato_4cut_v2/features/library/domain/entities/response/possession_products_response_entity.dart';
import 'package:potato_4cut_v2/features/library/domain/repositories/library_repository.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final LibraryDataSource _dataSource;

  LibraryRepositoryImpl({required LibraryDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future addFrame(String frameId) async {
    final response = await _dataSource.addFrame(frameId);
    return response;
  }

  @override
  Future<PossessionProductsResponseEntity> getPossessionProducts(
    bool bookmarkedOnly,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  ) async {
    final response = await _dataSource.getPossessionProducts(
      bookmarkedOnly,
      page,
      size,
      sortBy,
      direction,
    );
    return response.toEntity();
  }

  @override
  Future useFrame(String frameId) async {
    final response = await _dataSource.useFrame(frameId);
    return response;
  }

  @override
  Future onoffBookmark(String frameId) async {
    final response = await _dataSource.onoffBookmark(frameId);
    return response;
  }

  @override
  Future<void> deleteFrame(String frameId) async {
    await _dataSource.deleteFrame(frameId);
  }
}
