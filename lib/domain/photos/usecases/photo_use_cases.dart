import 'package:potato_4cut_v2/domain/photos/usecases/delete_photo_use_case.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/import_specific_photo_use_case.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/issue_4cut_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/photos/usecases/save_4cut_photos_use_case.dart';

class PhotoUseCases {
  final Save4cutPhotosUseCase save4cutPhotos;
  final ImportSpecificPhotoUseCase importSpecificPhoto;
  final DeletePhotoUseCase deletePhoto;
  final Issue4cutUploadLinkUseCase issue4cutUploadLink;

  PhotoUseCases({
    required this.save4cutPhotos,
    required this.importSpecificPhoto,
    required this.deletePhoto,
    required this.issue4cutUploadLink,
  });
}
