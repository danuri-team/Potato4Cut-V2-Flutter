import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';

class PossessionProductsResponseEntity {
  final bool success;
  final PossessionProductsDataEntity data;

  const PossessionProductsResponseEntity(this.success, this.data);
}

class PossessionProductsDataEntity {
  final List<LibraryFrameDataEntity> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const PossessionProductsDataEntity(
    this.content,
    this.currentPage,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
    this.hasNext,
    this.hasPrevious,
  );
}

class LibraryFrameDataEntity{
  final String frameId;
  final String title;
  final String previewImageUrl;
  final String frameBaseImageUrl;
  final String frameOverlayImageUrl;
  final FrameCategoryType category;
  final bool bookmarked;
  String? addedAt;
  String? lastUsedAt;
  final String creatorId;
  final String creatorNickname;

  LibraryFrameDataEntity(
    this.frameId,
    this.title,
    this.previewImageUrl,
    this.frameBaseImageUrl,
    this.frameOverlayImageUrl,
    this.category,
    this.bookmarked,
    this.addedAt,
    this.lastUsedAt,
    this.creatorId,
    this.creatorNickname,
  );
}
