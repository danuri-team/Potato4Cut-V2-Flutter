import 'package:potato_4cut_v2/domain/frame/use_cases/add_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/get_detailed_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/update_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/delete_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/get_frame_products_list_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/search_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/frame_by_tag_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/maded_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/like_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/cancle_like_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/get_frame_comment_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/add_frame_comment_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/issue_frame_layer_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/issue_frame_preview_upload_link_use_case.dart';

class FrameUseCases {
  final AddFrameUseCase addFrame;
  final GetDetailedFrameUseCase getDetailedFrame;
  final UpdateFrameUseCase updateFrame;
  final DeleteFrameUseCase deleteFrame;
  final GetFrameProductsListUseCase getFrameProductsList;
  final SearchFrameUseCase searchFrame;
  final FrameByTagUseCase frameByTag;
  final MadedFrameUseCase madedFrame;
  final LikeFrameUseCase likeFrame;
  final CancleLikeFrameUseCase cancleLikeFrame;
  final GetFrameCommentUseCase getFrameComment;
  final AddFrameCommentUseCase addFrameComment;
  final IssueFrameLayerUploadLinkUseCase issueFrameLayerUploadLink;
  final IssueFramePreviewUploadLinkUseCase issueFramePreviewUploadLink;

  FrameUseCases(
    this.addFrame,
    this.getDetailedFrame,
    this.updateFrame,
    this.deleteFrame,
    this.getFrameProductsList,
    this.searchFrame,
    this.frameByTag,
    this.madedFrame,
    this.likeFrame,
    this.cancleLikeFrame,
    this.getFrameComment,
    this.addFrameComment,
    this.issueFrameLayerUploadLink,
    this.issueFramePreviewUploadLink,
  );
}
