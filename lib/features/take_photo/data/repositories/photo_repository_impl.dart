import 'dart:io';

import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photo_data_source.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entities/save_photos_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository{
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl({required PhotoDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<SavePhotosEntity> savePhotos(List<File> images) async{
    final response = await _dataSource.savePhotos(images);
 final mapperResponse = response.toEntity();
 return mapperResponse;
  }

  @override
  Future save4CutPhotos(File composedImage, List<String> photoCutIds) async{
    await _dataSource.save4CutPhotos(composedImage, photoCutIds);
  }

  @override
  Future importSpecificPhoto(String id) async{
    await _dataSource.importSpecificPhoto(id);
  }

  @override
  Future<void> deletePhoto(String id) async{
    await _dataSource.deletePhoto(id);
  }
}