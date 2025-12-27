import 'package:potato_4cut_v2/domain/common/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/request/save_4cut_photos_request_entity.dart';
import 'package:potato_4cut_v2/domain/common/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/response/save_4cut_photos_response_entity.dart';

abstract class PhotoRepository {
  Future<Save4cutPhotosResponseEntity> save4CutPhotos(Save4cutPhotosRequestEntity request);

  Future importSpecificPhoto(String id);

  Future<void> deletePhoto(String id);

  Future<UploadLinkResponseEntity> issue4CutUploadLink(IssueUploadLinkRequestEntity request);
}