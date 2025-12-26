import 'package:potato_4cut_v2/data/make_frame/data_sources/frame_data_source.dart';
import 'package:potato_4cut_v2/data/make_frame/models/request/create_frame_request_model.dart';
import 'package:potato_4cut_v2/data/make_frame/models/request/issue_frame_upload_link_request_model.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/request/create_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/request/issue_frame_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/create_frame_response_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/frame_upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/repositories/frame_repository.dart';

class FrameRepositoryImpl implements FrameRepository {
  final FrameDataSource _dataSource;

  FrameRepositoryImpl({required FrameDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<FrameUploadLinkResponseEntity> issueFrameUploadLink(
    IssueFrameUploadLinkRequestEntity request,
  ) async {
    final requestModel = IssueFrameUploadLinkRequestModel(request.fileSize);
    final response = await _dataSource.issueFrameUploadLink(requestModel);
    return response.toEntity();
  }

  @override
  Future<FrameUploadLinkResponseEntity> issuePreviewUploadLink(
    IssueFrameUploadLinkRequestEntity request,
  ) async {
    final requestModel = IssueFrameUploadLinkRequestModel(request.fileSize);
    final response = await _dataSource.issuePreviewUploadLink(requestModel);
    return response.toEntity();
  }

  @override
  Future<CreateFrameResponseEntity> createFrame(
    CreateFrameRequestEntity request,
  ) async {
    final requestModel = CreateFrameRequestModel.fromEntity(request);
    final response = await _dataSource.createFrame(requestModel);
    return response.toEntity();
  }

  @override
  Future<void> uploadFileToS3(String uploadUrl, List<int> fileBytes, String contentType) async {
    await _dataSource.uploadFileToS3(uploadUrl, fileBytes, contentType);
  }
}
