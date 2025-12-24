import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/data/library/models/response/possession_products_response_model.dart';

abstract class LibraryDataSource {
  Future addFrame(String frameId);

  Future<PossessionProductsResponseModel> getPossessionProducts(
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
