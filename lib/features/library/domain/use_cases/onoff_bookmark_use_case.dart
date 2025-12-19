import 'package:potato_4cut_v2/features/library/domain/repositories/library_repository.dart';

class OnoffBookmarkUseCase {
  final LibraryRepository _repository;

  const OnoffBookmarkUseCase(this._repository);

  Future onoffBookmark(String frameId) async {
    final response = await _repository.onoffBookmark(frameId);
    return response;
  }
}
