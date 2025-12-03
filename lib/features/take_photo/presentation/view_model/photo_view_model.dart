import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photo_data_source_impl.dart';
import 'package:potato_4cut_v2/features/take_photo/data/repositories/photo_repository_impl.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entities/save_photos_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/delete_photo_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/import_specific_photo_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/photo_use_cases.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/save_4cut_photos_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/save_photos_use_case.dart';

final photoDataSourceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return PhotoDataSourceImpl(dio: dio);
});

final photoRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(photoDataSourceProvider);
  return PhotoRepositoryImpl(dataSource: dataSource);
});

final savePhotosProvider = Provider((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return SavePhotosUseCase(repository);
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

final photoUseCaseProvider = Provider((ref) {
  final savePhotos = ref.watch(savePhotosProvider);
  final save4cutPhotos = ref.watch(save4cutPhotosProvider);
  final importSpecificPhoto = ref.watch(importSpecificPhotoProvider);
  final deletePhoto = ref.watch(deletePhotoProvider);
  return PhotoUseCases(
    savePhotos: savePhotos,
    save4cutPhotos: save4cutPhotos,
    importSpecificPhoto: importSpecificPhoto,
    deletePhoto: deletePhoto,
  );
});

final photoViewModel =
    StateNotifierProvider<PhotoViewModelNotifier, PhotoUseCases>((ref) {
      final photoUseCase = ref.watch(photoUseCaseProvider);
      return PhotoViewModelNotifier(photoUseCase);
    });

class PhotoViewModelNotifier extends StateNotifier<PhotoUseCases> {
  PhotoViewModelNotifier(super.useCase);

  Future<SavePhotosEntity> savePhotos(List<File> images) async {
    final response = await state.savePhotos.savePhotos(images);
    return response;
  }

  Future save4cutPhotos(File composedImage, List<String> photoCutIds) async {
    final response = await state.save4cutPhotos.save4CutPhotos(
      composedImage,
      photoCutIds,
    );
    return response;
  }

  Future importSpecificPhoto(String id) async {
    await state.importSpecificPhoto.importSpecificPhoto(id);
  }

  Future<void> deletePhoto(String id) async {
    await state.deletePhoto.deletePhoto(id);
  }
}
