import 'package:potato_4cut_v2/features/library/domain/repositories/library_repository.dart';

class DeleteFrameUseCase {
  final LibraryRepository _repository;

  const DeleteFrameUseCase(this._repository);

  Future<void> deleteFrame(String frameId) async {
    await _repository.deleteFrame(frameId);
  }
}