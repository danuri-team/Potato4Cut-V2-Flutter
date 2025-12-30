import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class GetFrameProductsListUseCase {
  final FrameRepository _repository;

  GetFrameProductsListUseCase(this._repository);

  Future<FrameProductsListResponseEntity> getFrameProductsList(
    FrameCategoryType category,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  ) async {
    return await _repository.getFrameProductsList(
      category,
      page,
      size,
      sortBy,
      direction,
    );
  }
}
