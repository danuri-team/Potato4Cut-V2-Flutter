import 'package:potato_4cut_v2/features/take_photo/domain/usecases/delete_photo_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/import_specific_photo_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/save_4cut_photos_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/save_photos_use_case.dart';

class PhotoUseCases {
  final SavePhotosUseCase savePhotos;
  final Save4cutPhotosUseCase save4cutPhotos;
  final ImportSpecificPhotoUseCase importSpecificPhoto;
  final DeletePhotoUseCase deletePhoto;

  PhotoUseCases({
    required this.savePhotos,
    required this.save4cutPhotos,
    required this.importSpecificPhoto,
    required this.deletePhoto,
  });
}
