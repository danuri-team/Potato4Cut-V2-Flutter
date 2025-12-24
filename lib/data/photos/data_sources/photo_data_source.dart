import 'package:potato_4cut_v2/data/common/data/models/request/issue_upload_link_request_model.dart';
import 'package:potato_4cut_v2/data/photos/models/request/save_4cut_photos_request_model.dart';
import 'package:potato_4cut_v2/data/common/data/models/response/upload_link_response_model.dart';
import 'package:potato_4cut_v2/data/photos/models/response/save_4cut_photos_response_model.dart';


abstract class PhotoDataSource {
  Future<Save4cutPhotosResponseModel> save4CutPhotos(Save4cutPhotosRequestModel request);

  Future importSpecificPhoto(String id);

  Future<void> deletePhoto(String id);

  Future<UploadLinkResponseModel> issue4CutUploadLink(IssueUploadLinkRequestModel request);
}
