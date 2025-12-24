import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_status_type.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/detailed_frame_response_entity.dart';

part 'detailed_frame_response_model.g.dart';

@JsonSerializable()
class DetailedFrameResponseModel {
  final bool success;
  final DetailedFrameDataModel data;

  const DetailedFrameResponseModel(this.success, this.data);

  factory DetailedFrameResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DetailedFrameResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedFrameResponseModelToJson(this);

  DetailedFrameResponseEntity toEntity(){
    final data = this.data.toEntity();
    return DetailedFrameResponseEntity(success, data);
  }
}

@JsonSerializable()
class DetailedFrameDataModel {
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

  DetailedFrameDataModel(
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

  factory DetailedFrameDataModel.fromJson(Map<String, dynamic> json) =>
      _$DetailedFrameDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedFrameDataModelToJson(this);

  DetailedFrameDataEntity toEntity() {
    return DetailedFrameDataEntity(
      frameId,
      title,
      description,
      frameBaseImageUrl,
      frameOverlayImageUrl,
      previewImageUrl,
      category,
      status,
      price,
      downloadCount,
      likecount,
      viewCount,
      creatorId,
      creatorNickname,
      creatorProfileImageUrl,
      tags,
      createdAt,
      approvedAt,
      public,
      liked,
      inLibrary,
    );
  }
}
