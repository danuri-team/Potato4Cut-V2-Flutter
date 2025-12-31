import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/data/frame/data_sources/frame_data_source.dart';
import 'package:potato_4cut_v2/data/frame/data_sources/frame_data_source_impl.dart';
import 'package:potato_4cut_v2/data/frame/repositories/frame_repository_impl.dart';
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
import 'package:potato_4cut_v2/domain/frame/use_cases/add_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/add_frame_comment_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/cancle_like_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/delete_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/frame_by_tag_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/frame_use_cases.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/get_detailed_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/get_frame_comment_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/get_frame_products_list_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/issue_frame_layer_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/issue_frame_preview_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/like_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/maded_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/search_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/frame/use_cases/update_frame_use_case.dart';

final frameDataSourceProvider = Provider<FrameDataSource>(
  (ref) => FrameDataSourceImpl(null),
);

final frameRepositoryProvider = Provider<FrameRepository>((ref) {
  final dataSource = ref.watch(frameDataSourceProvider);
  return FrameRepositoryImpl(dataSource);
});

final frameUseCasesProvider = Provider<FrameUseCases>((ref) {
  final repository = ref.watch(frameRepositoryProvider);
  final addFrameUseCase = AddFrameUseCase(repository);
  final getDetailedFrameUseCase = GetDetailedFrameUseCase(repository);
  final updateFrameUseCase = UpdateFrameUseCase(repository);
  final deleteFrameUseCase = DeleteFrameUseCase(repository);
  final getFrameProductsListUseCase = GetFrameProductsListUseCase(repository);
  final searchFrameUseCase = SearchFrameUseCase(repository);
  final frameByTagUseCase = FrameByTagUseCase(repository);
  final madedFrameUseCase = MadedFrameUseCase(repository);
  final likeFrameUseCase = LikeFrameUseCase(repository);
  final cancleLikeFrameUseCase = CancleLikeFrameUseCase(repository);
  final getFrameCommentUseCase = GetFrameCommentUseCase(repository);
  final addFrameCommentUseCase = AddFrameCommentUseCase(repository);
  final issueFrameLayerUploadLinkUseCase = IssueFrameLayerUploadLinkUseCase(repository);
  final issueFramePreviewUploadLinkUseCase = IssueFramePreviewUploadLinkUseCase(repository);

  return FrameUseCases(
    addFrameUseCase,
    getDetailedFrameUseCase,
    updateFrameUseCase,
    deleteFrameUseCase,
    getFrameProductsListUseCase,
    searchFrameUseCase,
    frameByTagUseCase,
    madedFrameUseCase,
    likeFrameUseCase,
    cancleLikeFrameUseCase,
    getFrameCommentUseCase,
    addFrameCommentUseCase,
    issueFrameLayerUploadLinkUseCase,
    issueFramePreviewUploadLinkUseCase,
  );
});

final frameViewModelProvider = StateNotifierProvider<FrameViewModelNotifier, FrameUseCases>((ref) {
  final useCases = ref.watch(frameUseCasesProvider);
  return FrameViewModelNotifier(useCases);
});

class FrameViewModelNotifier extends StateNotifier<FrameUseCases> {
  final FrameUseCases _useCases;

  FrameViewModelNotifier(this._useCases) : super(_useCases);

  Future<void> addFrame(AddFrameRequestEntity request) async {
    await _useCases.addFrame.addFrame(request);
  }

  Future<DetailedFrameResponseEntity> getDetailedFrame(String frameId) async {
    return await _useCases.getDetailedFrame.getDetailedFrame(frameId);
  }

  Future<void> updateFrame(String frameId, UpdateFrameRequestEntity request) async {
    await _useCases.updateFrame.updateFrame(frameId, request);
  }

  Future<void> deleteFrame(String frameId) async {
    await _useCases.deleteFrame.deleteFrame(frameId);
  }

  Future<FrameProductsListResponseEntity> getFrameProductsList(
    FrameCategoryType category,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  ) async {
    return await _useCases.getFrameProductsList.getFrameProductsList(
      category,
      page,
      size,
      sortBy,
      direction,
    );
  }

  Future<FrameProductsListResponseEntity> searchFrame(String keyword, int page, int size) async {
    return await _useCases.searchFrame.searchFrame(keyword, page, size);
  }

  Future<FrameProductsListResponseEntity> frameByTag(String tags, int page, int size) async {
    return await _useCases.frameByTag.frameByTag(tags, page, size);
  }

  Future<FrameProductsListResponseEntity> madedFrame() async {
    return await _useCases.madedFrame.madedFrame();
  }

  Future<SuccessResponseEntity> likeFrame(String frameId) async {
    return await _useCases.likeFrame.likeFrame(frameId);
  }

  Future<SuccessResponseEntity> cancleLikeFrame(String frameId) async {
    return await _useCases.cancleLikeFrame.cancleLikeFrame(frameId);
  }

  Future<FrameCommentResponseEntity> getFrameComment(String frameId) async {
    return await _useCases.getFrameComment.getFrameComment(frameId);
  }

  Future<AddFrameCommentResponseEntity> addFrameComment(String frameId, AddFrameCommentRequestEntity request) async {
    return await _useCases.addFrameComment.addFrameComment(frameId, request);
  }

  Future<UploadLinkResponseEntity> issueFrameLayerUploadLink(IssueUploadLinkRequestEntity request) async {
    return await _useCases.issueFrameLayerUploadLink.issueFrameLayerUploadLink(request);
  }

  Future<UploadLinkResponseEntity> issueFramePreviewUploadLink(IssueUploadLinkRequestEntity request) async {
    return await _useCases.issueFramePreviewUploadLink.issueFramePreviewUploadLink(request);
  }
}
