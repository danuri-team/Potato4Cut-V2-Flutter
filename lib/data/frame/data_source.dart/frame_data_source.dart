import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/data/common/data/models/response/upload_link_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/request/add_frame_comment_request_model.dart';
import 'package:potato_4cut_v2/data/frame/models/request/add_frame_request_model.dart';
import 'package:potato_4cut_v2/data/common/data/models/request/issue_upload_link_request_model.dart';
import 'package:potato_4cut_v2/data/frame/models/request/update_frame_request_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/add_frame_comment_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/detailed_frame_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/frame_comment_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/frame_products_list_response_model.dart';
import 'package:potato_4cut_v2/data/frame/models/response/success_response_model.dart';

abstract class FrameDataSource {
  Future addFrame(AddFrameRequestModel request);
  Future<DetailedFrameResponseModel> getDetailedFrame(String frameId);
  Future updateFrame(String frameId, UpdateFrameRequestModel request);
  Future<void> deleteFrame(String frameId);
  Future<FrameProductsListResponseModel> getFrameProductsList(
    FrameCategoryType category,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  );
  Future<FrameProductsListResponseModel> searchFrame(String keyword, int page, int size);
  Future<FrameProductsListResponseModel> frameByTag(String tags, int page, int size);
  Future madedFrame();
  Future<SuccessResponseModel> likeFrame(String frameId);
  Future<SuccessResponseModel> cancleLikeFrame(String frameId); 
  Future<FrameCommentResponseModel> getFrameComment(String frameId);
  Future<AddFrameCommentResponseModel> addFrameComment(String frameId, AddFrameCommentRequestModel request);
  Future<UploadLinkResponseModel> issueFrameLayerUploadLink(IssueUploadLinkRequestModel request);
  Future<UploadLinkResponseModel> issueFramePreviewUploadLink(IssueUploadLinkRequestModel request);
}
