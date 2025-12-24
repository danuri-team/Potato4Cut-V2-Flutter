import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_request_entity.dart';

part 'add_frame_request_model.g.dart';

@JsonSerializable()
class AddFrameRequestModel {
  final String title;
  final String description;
  final String isPublic;
  final int price;
  final String frameBaseImageKey;
  final String frameOverlayImageKey;
  final String previewImageKey;
  final FrameCategoryType category;
  final List<String> tags;

  const AddFrameRequestModel(
    this.title,
    this.description,
    this.isPublic,
    this.price,
    this.frameBaseImageKey,
    this.frameOverlayImageKey,
    this.previewImageKey,
    this.category,
    this.tags,
  );

  factory AddFrameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddFrameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddFrameRequestModelToJson(this);

  AddFrameRequestEntity toEntity() {
    return AddFrameRequestEntity(
      title,
      description,
      isPublic,
      price,
      frameBaseImageKey,
      frameOverlayImageKey,
      previewImageKey,
      category,
      tags,
    );
  }
}
