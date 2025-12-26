import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/response/create_frame_response_entity.dart';

part 'create_frame_response_model.g.dart';

@JsonSerializable()
class CreateFrameResponseModel {
  final bool success;
  final CreateFrameDataModel data;
  final String message;

  const CreateFrameResponseModel(this.success, this.data, this.message);

  factory CreateFrameResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateFrameResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFrameResponseModelToJson(this);

  CreateFrameResponseEntity toEntity() {
    return CreateFrameResponseEntity(success, data.toEntity(), message);
  }
}

@JsonSerializable()
class CreateFrameDataModel {
  final String frameId;
  final String title;
  final String description;
  final bool public;
  final int price;
  final String frameBaseImageUrl;
  final String? frameOverlayImageUrl;
  final String previewImageUrl;
  final String category;
  final List<String> tags;

  const CreateFrameDataModel({
    required this.frameId,
    required this.title,
    required this.description,
    required this.public,
    required this.price,
    required this.frameBaseImageUrl,
    this.frameOverlayImageUrl,
    required this.previewImageUrl,
    required this.category,
    required this.tags,
  });

  factory CreateFrameDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateFrameDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFrameDataModelToJson(this);

  CreateFrameDataEntity toEntity() {
    return CreateFrameDataEntity(
      frameId: frameId,
      title: title,
      description: description,
      public: public,
      price: price,
      frameBaseImageUrl: frameBaseImageUrl,
      frameOverlayImageUrl: frameOverlayImageUrl,
      previewImageUrl: previewImageUrl,
      category: category,
      tags: tags,
    );
  }
}
