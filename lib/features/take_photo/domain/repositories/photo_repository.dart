import 'package:potato_4cut_v2/features/take_photo/domain/entites/request/issue_4cut_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/request/save_4cut_photos_request_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/response/fourcut_upload_link_response_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/response/save_4cut_photos_response_entity.dart';

abstract class PhotoRepository {
  Future<Save4cutPhotosResponseEntity> save4CutPhotos(Save4cutPhotosRequestEntity request);

  Future importSpecificPhoto(String id);

  Future<void> deletePhoto(String id);

  Future<FourcutUploadLinkResponseEntity> issue4CutUploadLink(Issue4cutUploadLinkRequestEntity request);
}