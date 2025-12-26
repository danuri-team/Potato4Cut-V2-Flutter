import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/request/create_frame_request_entity.dart';

part 'create_frame_request_model.g.dart';

@JsonSerializable()
class CreateFrameRequestModel {
  final String title;
  final String description;
  final bool isPublic;
  final int price;
  final String frameBaseImageKey;
  final String? frameOverlayImageKey;
  final String previewImageKey;
  final String category;
  final List<String> tags;

  const CreateFrameRequestModel({
    required this.title,
    required this.description,
    required this.isPublic,
    required this.price,
    required this.frameBaseImageKey,
    this.frameOverlayImageKey,
    required this.previewImageKey,
    required this.category,
    required this.tags,
  });

  factory CreateFrameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateFrameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFrameRequestModelToJson(this);

  factory CreateFrameRequestModel.fromEntity(CreateFrameRequestEntity entity) {
    return CreateFrameRequestModel(
      title: entity.title,
      description: entity.description,
      isPublic: entity.isPublic,
      price: entity.price,
      frameBaseImageKey: entity.frameBaseImageKey,
      frameOverlayImageKey: entity.frameOverlayImageKey,
      previewImageKey: entity.previewImageKey,
      category: entity.category,
      tags: entity.tags,
    );
  }

  CreateFrameRequestEntity toEntity() {
    return CreateFrameRequestEntity(
      title: title,
      description: description,
      isPublic: isPublic,
      price: price,
      frameBaseImageKey: frameBaseImageKey,
      frameOverlayImageKey: frameOverlayImageKey,
      previewImageKey: previewImageKey,
      category: category,
      tags: tags,
    );
  }
}
