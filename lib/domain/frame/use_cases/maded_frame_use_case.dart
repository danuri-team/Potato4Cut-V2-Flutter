import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class MadedFrameUseCase {
  final FrameRepository _repository;

  MadedFrameUseCase(this._repository);

  Future<FrameProductsListResponseEntity> madedFrame() async {
    return await _repository.madedFrame();
  }
}
