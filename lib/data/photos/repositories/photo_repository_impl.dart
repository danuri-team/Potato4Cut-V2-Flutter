import 'package:potato_4cut_v2/data/common/models/request/issue_upload_link_request_model.dart';
import 'package:potato_4cut_v2/data/photos/data_sources/photo_data_source.dart';
import 'package:potato_4cut_v2/data/photos/models/request/save_4cut_photos_request_model.dart';
import 'package:potato_4cut_v2/domain/common/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/request/save_4cut_photos_request_entity.dart';
import 'package:potato_4cut_v2/domain/common/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/response/save_4cut_photos_response_entity.dart';
import 'package:potato_4cut_v2/domain/photos/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository{
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl({required PhotoDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Save4cutPhotosResponseEntity> save4CutPhotos(Save4cutPhotosRequestEntity request) async{
    final requestModel = Save4cutPhotosRequestModel(request.frameId, request.objectKey);
    final response = await _dataSource.save4CutPhotos(requestModel);
    return response.toEntity();
  }

  @override
  Future importSpecificPhoto(String id) async{
    await _dataSource.importSpecificPhoto(id);
  }

  @override
  Future<void> deletePhoto(String id) async{
    await _dataSource.deletePhoto(id);
  }

  @override
  Future<UploadLinkResponseEntity> issue4CutUploadLink(IssueUploadLinkRequestEntity request) async{
    final requestModel = IssueUploadLinkRequestModel(request.fileSize);
    final response = await _dataSource.issue4CutUploadLink(requestModel);
    return response.toEntity();
  }
}