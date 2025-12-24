import 'package:potato_4cut_v2/domain/library/repositories/library_repository.dart';

class UseFrameUseCase {
  final LibraryRepository _repository;

  const UseFrameUseCase(this._repository);

  Future useFrame(String frameId) async {
    final response = await _repository.useFrame(frameId);
    return response;
  }
}