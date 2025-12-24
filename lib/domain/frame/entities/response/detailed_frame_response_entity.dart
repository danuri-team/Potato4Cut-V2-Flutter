import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_status_type.dart';

class DetailedFrameResponseEntity {
  final bool success;
  final DetailedFrameDataEntity data;

  const DetailedFrameResponseEntity(this.success, this.data);
}

class DetailedFrameDataEntity {
  final String frameId;
  final String title;
  final String description;
  String? frameBaseImageUrl;
  String? frameOverlayImageUrl;
  final String previewImageUrl;
  final FrameCategoryType category;
  final FrameStatusType status;
  final int price;
  final int downloadCount;
  final int likecount;
  final int viewCount;
  final String creatorId;
  final String creatorNickname;
  String? creatorProfileImageUrl;
  final List<String> tags;
  final String createdAt;
  final String approvedAt;
  final bool public;
  final bool liked;
  final bool inLibrary;

  DetailedFrameDataEntity(
    this.frameId,
    this.title,
    this.description,
    this.frameBaseImageUrl,
    this.frameOverlayImageUrl,
    this.previewImageUrl,
    this.category,
    this.status,
    this.price,
    this.downloadCount,
    this.likecount,
    this.viewCount,
    this.creatorId,
    this.creatorNickname,
    this.creatorProfileImageUrl,
    this.tags,
    this.createdAt,
    this.approvedAt,
    this.public,
    this.liked,
    this.inLibrary,
  );
}