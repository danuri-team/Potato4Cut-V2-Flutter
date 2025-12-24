import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/data/photos/data_sources/photo_data_source_impl.dart';
import 'package:potato_4cut_v2/data/photos/repositories/photo_repository_impl.dart';
import 'package:potato_4cut_v2/data/common/domain/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/request/save_4cut_photos_request_entity.dart';
import 'package:potato_4cut_v2/data/common/domain/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/response/save_4cut_photos_response_entity.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/delete_photo_use_case.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/import_specific_photo_use_case.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/issue_4cut_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/photo_use_cases.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/save_4cut_photos_use_case.dart';

final photoDataSourceProvider = Provider((ref) => PhotoDataSourceImpl(null));

final photoRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(photoDataSourceProvider);
  return PhotoRepositoryImpl(dataSource: dataSource);
});

final save4cutPhotosProvider = Provider((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return Save4cutPhotosUseCase(repository);
});

final importSpecificPhotoProvider = Provider((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return ImportSpecificPhotoUseCase(repository);
});

final deletePhotoProvider = Provider((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return DeletePhotoUseCase(repository);
});

final issue4CutUploadLinkProvider = Provider((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return Issue4cutUploadLinkUseCase(repository);
});

final photoUseCaseProvider = Provider((ref) {
  final save4cutPhotos = ref.watch(save4cutPhotosProvider);
  final importSpecificPhoto = ref.watch(importSpecificPhotoProvider);
  final deletePhoto = ref.watch(deletePhotoProvider);
  final issue4cutUploadLink = ref.watch(issue4CutUploadLinkProvider);
  return PhotoUseCases(
    save4cutPhotos: save4cutPhotos,
    importSpecificPhoto: importSpecificPhoto,
    deletePhoto: deletePhoto,
    issue4cutUploadLink: issue4cutUploadLink,
  );
});

final photoViewModel =
    StateNotifierProvider<PhotoViewModelNotifier, PhotoUseCases>((ref) {
      final photoUseCase = ref.watch(photoUseCaseProvider);
      return PhotoViewModelNotifier(photoUseCase);
    });

class PhotoViewModelNotifier extends StateNotifier<PhotoUseCases> {
  PhotoViewModelNotifier(super.useCase);

  Future<Save4cutPhotosResponseEntity> save4cutPhotos(Save4cutPhotosRequestEntity request) async {
    final response = await state.save4cutPhotos.save4CutPhotos(request);
    return response;
  }

  Future importSpecificPhoto(String id) async {
    await state.importSpecificPhoto.importSpecificPhoto(id);
  }

  Future<void> deletePhoto(String id) async {
    await state.deletePhoto.deletePhoto(id);
  }

  Future<UploadLinkResponseEntity> issue4cutUploadLink(IssueUploadLinkRequestEntity request) async{
    final response = await state.issue4cutUploadLink.issue4CutUploadLink(request);
    return response;
  }
}
