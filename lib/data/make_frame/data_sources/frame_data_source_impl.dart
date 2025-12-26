import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/data/make_frame/data_sources/frame_data_source.dart';
import 'package:potato_4cut_v2/data/make_frame/models/request/create_frame_request_model.dart';
import 'package:potato_4cut_v2/data/make_frame/models/request/issue_frame_upload_link_request_model.dart';
import 'package:potato_4cut_v2/data/make_frame/models/response/create_frame_response_model.dart';
import 'package:potato_4cut_v2/data/make_frame/models/response/frame_upload_link_response_model.dart';

class FrameDataSourceImpl implements FrameDataSource {
  final Dio _dio;

  FrameDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  final tokenStorage = TokenStorage();

  @override
  Future<FrameUploadLinkResponseModel> issueFrameUploadLink(
    IssueFrameUploadLinkRequestModel request,
  ) async {
    final response = await _dio.post(
      '/api/v1/frames/presigned-url/frame',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}'}),
    );
    return FrameUploadLinkResponseModel.fromJson(response.data);
  }

  @override
  Future<FrameUploadLinkResponseModel> issuePreviewUploadLink(
    IssueFrameUploadLinkRequestModel request,
  ) async {
    final response = await _dio.post(
      '/api/v1/frames/presigned-url/preview',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}'}),
    );
    return FrameUploadLinkResponseModel.fromJson(response.data);
  }

  @override
  Future<CreateFrameResponseModel> createFrame(
    CreateFrameRequestModel request,
  ) async {
    final response = await _dio.post(
      '/api/v1/frames',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}'}),
    );
    return CreateFrameResponseModel.fromJson(response.data);
  }

  @override
  Future<void> uploadFileToS3(String uploadUrl, List<int> fileBytes, String contentType) async {
    final dio = Dio();
    await dio.put(
      uploadUrl,
      data: Stream.fromIterable(fileBytes.map((e) => [e])),
      options: Options(
        headers: {
          'Content-Type': contentType,
          'Content-Length': fileBytes.length,
        },
      ),
    );
  }
}
