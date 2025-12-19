import 'package:potato_4cut_v2/features/library/domain/repositories/library_repository.dart';

class AddFrameUseCase {
  final LibraryRepository _repository;
  
  const AddFrameUseCase(this._repository);

  Future addFrame(String frameId)async{
    final response = await _repository.addFrame(frameId);
    return response;
  }
}