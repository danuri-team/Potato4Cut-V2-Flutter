import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/domain/library/entities/response/possession_products_response_entity.dart';

part 'library_frame_data_model.g.dart';

@JsonSerializable()
class LibraryFrameDataModel {
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

  LibraryFrameDataModel(
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

  factory LibraryFrameDataModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryFrameDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryFrameDataModelToJson(this);

  LibraryFrameDataEntity toEntity() {
    return LibraryFrameDataEntity(
      frameId,
      title,
      previewImageUrl,
      frameBaseImageUrl,
      frameOverlayImageUrl,
      category,
      bookmarked,
      addedAt,
      lastUsedAt,
      creatorId,
      creatorNickname,
    );
  }
}
