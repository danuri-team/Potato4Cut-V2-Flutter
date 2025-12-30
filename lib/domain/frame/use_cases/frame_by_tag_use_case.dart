import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class FrameByTagUseCase {
  final FrameRepository _repository;

  FrameByTagUseCase(this._repository);

  Future<FrameProductsListResponseEntity> frameByTag(String tags, int page, int size) async {
    return await _repository.frameByTag(tags, page, size);
  }
}
