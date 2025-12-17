import 'package:potato_4cut_v2/features/take_photo/data/models/request/issue_4cut_upload_link_request_model.dart';
import 'package:potato_4cut_v2/features/take_photo/data/models/request/save_4cut_photos_request_model.dart';
import 'package:potato_4cut_v2/features/take_photo/data/models/response/fourcut_upload_link_response_model.dart';
import 'package:potato_4cut_v2/features/take_photo/data/models/response/save_4cut_photos_response_model.dart';


abstract class PhotoDataSource {
  Future<Save4cutPhotosResponseModel> save4CutPhotos(Save4cutPhotosRequestModel request);

  Future importSpecificPhoto(String id);

  Future<void> deletePhoto(String id);

  Future<FourcutUploadLinkResponseModel> issue4CutUploadLink(Issue4cutUploadLinkRequestModel request);
}
