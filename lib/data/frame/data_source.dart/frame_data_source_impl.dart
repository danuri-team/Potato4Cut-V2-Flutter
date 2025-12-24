import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/storage/token_storage.dart';
import 'package:potato_4cut_v2/data/common/data/models/response/upload_link_response_model.dart';
import 'package:potato_4cut_v2/data/frame/data_source.dart/frame_data_source.dart';
import 'package:potato_4cut_v2/data/frame/models/request/add_frame_comment_request_model.dart';
import 'package:potato_4cut_v2/data/frame/models/request/add_frame_request_model.dart';
import 'package:potato_4cut_v2/data/common/data/models/request/issue_upload_link_request_model.dart';
import 'package:potato_4cut_v2/data/frame/models/request/update_frame_request_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/add_frame_comment_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/detailed_frame_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/frame_comment_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/frame_products_list_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/success_response_model.dart';

class FrameDataSourceImpl implements FrameDataSource {
  final Dio _dio;

  FrameDataSourceImpl(Dio? dio) : _dio = dio ?? AppDio.getInstance();

  Future<Options> _getOptions({String? contentType}) async {
    final tokenStorage = TokenStorage();
    return Options(
      headers: {
        'Authorization': 'Bearer ${await tokenStorage.getAccessToken()}',
      },
      contentType: contentType,
    );
  }
  
  @override
  Future addFrame(AddFrameRequestModel request) async{
    final response = await _dio.post(
      '/api/v1/frames',
      options: await _getOptions(),
    );
  }

  @override
  Future<DetailedFrameResponseModel> getDetailedFrame(String frameId) async{
    final response = await _dio.get(
      '/api/v1/frames/$frameId',
      options: await _getOptions(),
    );
    return DetailedFrameResponseModel.fromJson(response.data);
  }

  @override
  Future updateFrame(String frameId, UpdateFrameRequestModel request) async{
    final response = await _dio.put(
      '/api/v1/frames/$frameId',
      data: request.toJson(),
      options: await _getOptions(),
    );
  }

  @override
  Future<void> deleteFrame(String frameId) async{
    await _dio.delete(
      '/api/v1/frames/$frameId',
      options: await _getOptions(),
    );
  }

  @override
  Future<FrameProductsListResponseModel> getFrameProductsList(FrameCategoryType category, int page, int size, SortbyType sortBy, DirectionType direction) async{
    final categoryString = category.name;
    final sortByString = sortBy.name;
    final directionString = direction.name;
    final response = await _dio.get(
      '/api/v1/frames?category=$categoryString&page=$page&size=$size&sortBy=$sortByString&direction=$directionString',
      options: await _getOptions(),
    );
    return FrameProductsListResponseModel.fromJson(response.data);
  }

  @override
  Future<FrameProductsListResponseModel> searchFrame(String keyword, int page, int size) async{
    final response = await _dio.get(
      '/api/v1/frames/search?$keyword&page=$page&size=$size',
      options: await _getOptions(),
    );
    return FrameProductsListResponseModel.fromJson(response.data);
  }

  @override
  Future<FrameProductsListResponseModel> frameByTag(String tags, int page, int size) async{
    final response = await _dio.get(
      '/api/v1/frames/tags/$tags?page=$page&size=$size',
      options: await _getOptions(),
    );
    return FrameProductsListResponseModel.fromJson(response.data);
  }

  @override
  Future madedFrame() async{
    final response = await _dio.get(
      '/api/v1/frames/my',
      options: await _getOptions(),
    );
  }

  @override
  Future<SuccessResponseModel> likeFrame(String frameId) async{
    final response = await _dio.post(
      '/api/v1/frames/$frameId/like',
      options: await _getOptions(),
    );
    return SuccessResponseModel.fromJson(response.data);
  }

  @override
  Future<SuccessResponseModel> cancleLikeFrame(String frameId) async{
    final response = await _dio.delete(
      '/api/v1/frames/$frameId/like',
      options: await _getOptions(),
    );
    return SuccessResponseModel.fromJson(response.data);
  }

  @override
  Future<FrameCommentResponseModel> getFrameComment(String frameId) async{
    final response = await _dio.get(
      '/api/v1/frames/$frameId/comments',
      options: await _getOptions(),
    );
    return FrameCommentResponseModel.fromJson(response.data);
  }

  @override
  Future<AddFrameCommentResponseModel> addFrameComment(String frameId, AddFrameCommentRequestModel request) async{
    final response = await _dio.post(
      '/api/v1/frames/$frameId/comments',
      options: await _getOptions(),
    );
    return AddFrameCommentResponseModel.fromJson(response.data);
  }

  @override
  Future<UploadLinkResponseModel> issueFrameLayerUploadLink(IssueUploadLinkRequestModel request) async{
    final response = await _dio.post(
      '/api/v1/frames/presigned-url/frame',
      options: await _getOptions(),
    );
    return UploadLinkResponseModel.fromJson(response.data);
  }

  @override
  Future<UploadLinkResponseModel> issueFramePreviewUploadLink(IssueUploadLinkRequestModel request) async{
    final response = await _dio.post(
      '/api/v1/frames/presigned-url/preview',
      options: await _getOptions(),
    );
    return UploadLinkResponseModel.fromJson(response.data);
  }
}
