import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/data/common/domain/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/data/common/domain/entities/response/upload_link_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_comment_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/add_frame_comment_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_comment_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/update_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/detailed_frame_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/success_response_entity.dart';

abstract class FrameRepository {
  Future addFrame(AddFrameRequestEntity request);
  Future<DetailedFrameResponseEntity> getDetailedFrame(String frameId);
  Future updateFrame(String frameId, UpdateFrameRequestEntity request);
  Future<void> deleteFrame(String frameId);
  Future<FrameProductsListResponseEntity> getFrameProductsList(
    FrameCategoryType category,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  );
  Future<FrameProductsListResponseEntity> searchFrame(String keyword, int page, int size);
  Future<FrameProductsListResponseEntity> frameByTag(String tags, int page, int size);
  Future madedFrame();
  Future<SuccessResponseEntity> likeFrame(String frameId);
  Future<SuccessResponseEntity> cancleLikeFrame(String frameId); 
  Future<FrameCommentResponseEntity> getFrameComment(String frameId);
  Future<AddFrameCommentResponseEntity> addFrameComment(String frameId, AddFrameCommentRequestEntity request);
  Future<UploadLinkResponseEntity> issueFrameLayerUploadLink(IssueUploadLinkRequestEntity request);
  Future<UploadLinkResponseEntity> issueFramePreviewUploadLink(IssueUploadLinkRequestEntity request);
}