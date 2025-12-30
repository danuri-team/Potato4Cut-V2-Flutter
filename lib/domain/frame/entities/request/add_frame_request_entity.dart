import 'package:potato_4cut_v2/core/enum/frame_category_type.dart';
import 'package:potato_4cut_v2/data/frame/models/request/add_frame_request_model.dart';

class AddFrameRequestEntity {
  final String title;
  final String description;
  final String isPublic;
  final int price;
  final String frameBaseImageKey;
  final String frameOverlayImageKey;
  final String previewImageKey;
  final FrameCategoryType category;
  final List<String> tags;

  const AddFrameRequestEntity(
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

  AddFrameRequestModel toModel() {
    return AddFrameRequestModel(
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