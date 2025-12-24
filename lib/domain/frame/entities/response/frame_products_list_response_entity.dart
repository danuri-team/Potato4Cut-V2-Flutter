import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_status_type.dart';

class FrameProductsListResponseEntity {
  final bool success;
  final FrameProductsListDataEntity data;

  const FrameProductsListResponseEntity(this.success, this.data);
}

class FrameProductsListDataEntity{
  final List<FrameProcutContentEntity> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const FrameProductsListDataEntity(
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

class FrameProcutContentEntity{
  final String frameId;
  final String title;
  final String previewImageUrl;
  final FrameCategoryType category;
  final FrameStatusType status;
  final int price;
  final int downloadCount;
  final int likeCount;
  final int viewCount;
  final String creatorId;
  final String creatorNickname;
  final String createdAt;
  final bool public;

  const FrameProcutContentEntity(
    this.frameId,
    this.title,
    this.previewImageUrl,
    this.category,
    this.status,
    this.price,
    this.downloadCount,
    this.likeCount,
    this.viewCount,
    this.creatorId,
    this.creatorNickname,
    this.createdAt,
    this.public
  );
}