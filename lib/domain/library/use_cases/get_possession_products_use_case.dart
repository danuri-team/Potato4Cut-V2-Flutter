import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/domain/library/entities/response/possession_products_response_entity.dart';
import 'package:potato_4cut_v2/domain/library/repositories/library_repository.dart';

class GetPossessionProductsUseCase {
  final LibraryRepository _repository;

  const GetPossessionProductsUseCase(this._repository);

  Future<PossessionProductsResponseEntity> getPossessionProducts(
    bool bookmarkedOnly,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  ) async {
    final response = await _repository.getPossessionProducts(
      bookmarkedOnly,
      page,
      size,
      sortBy,
      direction,
    );
    return response;
  }
}
