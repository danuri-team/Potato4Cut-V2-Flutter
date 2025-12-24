import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_status_type.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';

part 'frame_products_list_response_model.g.dart';

@JsonSerializable()
class FrameProductsListResponseModel {
  final bool success;
  final FrameProductsListDataModel data;

  const FrameProductsListResponseModel(this.success, this.data);

  factory FrameProductsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FrameProductsListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrameProductsListResponseModelToJson(this);

  FrameProductsListResponseEntity toEntity() {
    final data = this.data.toEntity();
    return FrameProductsListResponseEntity(success, data);
  }
}

@JsonSerializable()
class FrameProductsListDataModel {
  final List<FrameProcutContentModel> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const FrameProductsListDataModel(
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

  factory FrameProductsListDataModel.fromJson(Map<String, dynamic> json) =>
      _$FrameProductsListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrameProductsListDataModelToJson(this);

  FrameProductsListDataEntity toEntity() {
    final content = List.generate(
      this.content.length,
      (index) => this.content[index].toEntity(),
    );
    return FrameProductsListDataEntity(
      content,
      currentPage,
      pageSize,
      totalElements,
      totalPages,
      first,
      last,
      hasNext,
      hasPrevious,
    );
  }
}

@JsonSerializable()
class FrameProcutContentModel {
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

  const FrameProcutContentModel(
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
    this.public,
  );

  factory FrameProcutContentModel.fromJson(Map<String, dynamic> json) =>
      _$FrameProcutContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrameProcutContentModelToJson(this);

  FrameProcutContentEntity toEntity() {
    return FrameProcutContentEntity(
      frameId,
      title,
      previewImageUrl,
      category,
      status,
      price,
      downloadCount,
      likeCount,
      viewCount,
      creatorId,
      creatorNickname,
      createdAt,
      public,
    );
  }
}
