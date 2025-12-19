import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/features/library/domain/entities/response/possession_products_response_entity.dart';

abstract class LibraryRepository {
  Future addFrame(String frameId);

  Future<PossessionProductsResponseEntity> getPossessionProducts(
    bool bookmarkedOnly,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  );

  Future useFrame(String frameId);

  Future onoffBookmark(String frameId);

  Future<void> deleteFrame(String frameId);
}