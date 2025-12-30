import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class SearchFrameUseCase {
  final FrameRepository _repository;

  SearchFrameUseCase(this._repository);

  Future<FrameProductsListResponseEntity> searchFrame(String keyword, int page, int size) async {
    return await _repository.searchFrame(keyword, page, size);
  }
}
