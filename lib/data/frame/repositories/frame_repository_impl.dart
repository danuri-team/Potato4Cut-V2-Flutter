import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/data/frame/data_sources/frame_data_source.dart';
import 'package:potato_4cut_v2/domain/common/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/common/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_comment_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/update_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/add_frame_comment_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/detailed_frame_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_comment_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/success_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class FrameRepositoryImpl implements FrameRepository {
  final FrameDataSource _dataSource;

  FrameRepositoryImpl(this._dataSource);

  @override
  Future addFrame(AddFrameRequestEntity request) async {
    return await _dataSource.addFrame(request.toModel());
  }

  @override
  Future<DetailedFrameResponseEntity> getDetailedFrame(String frameId) async {
    final response = await _dataSource.getDetailedFrame(frameId);
    return response.toEntity();
  }

  @override
  Future updateFrame(String frameId, UpdateFrameRequestEntity request) async {
    return await _dataSource.updateFrame(frameId, request.toModel());
  }

  @override
  Future<void> deleteFrame(String frameId) async {
    return await _dataSource.deleteFrame(frameId);
  }

  @override
  Future<FrameProductsListResponseEntity> getFrameProductsList(
    FrameCategoryType category,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  ) async {
    final response = await _dataSource.getFrameProductsList(
      category,
      page,
      size,
      sortBy,
      direction,
    );
    return response.toEntity();
  }

  @override
  Future<FrameProductsListResponseEntity> searchFrame(String keyword, int page, int size) async {
    final response = await _dataSource.searchFrame(keyword, page, size);
    return response.toEntity();
  }

  @override
  Future<FrameProductsListResponseEntity> frameByTag(String tags, int page, int size) async {
    final response = await _dataSource.frameByTag(tags, page, size);
    return response.toEntity();
  }

  @override
  Future<FrameProductsListResponseEntity> madedFrame() async {
    final response = await _dataSource.madedFrame();
    return response.toEntity();
  }

  @override
  Future<SuccessResponseEntity> likeFrame(String frameId) async {
    final response = await _dataSource.likeFrame(frameId);
    return response.toEntity();
  }

  @override
  Future<SuccessResponseEntity> cancleLikeFrame(String frameId) async {
    final response = await _dataSource.cancleLikeFrame(frameId);
    return response.toEntity();
  }

  @override
  Future<FrameCommentResponseEntity> getFrameComment(String frameId) async {
    final response = await _dataSource.getFrameComment(frameId);
    return response.toEntity();
  }

  @override
  Future<AddFrameCommentResponseEntity> addFrameComment(String frameId, AddFrameCommentRequestEntity request) async {
    final response = await _dataSource.addFrameComment(frameId, request.toModel());
    return response.toEntity();
  }

  @override
  Future<UploadLinkResponseEntity> issueFrameLayerUploadLink(IssueUploadLinkRequestEntity request) async {
    final response = await _dataSource.issueFrameLayerUploadLink(request.toModel());
    return response.toEntity();
  }

  @override
  Future<UploadLinkResponseEntity> issueFramePreviewUploadLink(IssueUploadLinkRequestEntity request) async {
    final response = await _dataSource.issueFramePreviewUploadLink(request.toModel());
    return response.toEntity();
  }
}
