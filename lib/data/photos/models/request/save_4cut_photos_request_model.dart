import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';
import 'package:potato_4cut_v2/domain/photos/entites/request/save_4cut_photos_request_entity.dart';

part 'save_4cut_photos_request_model.g.dart';

@JsonSerializable()
class Save4cutPhotosRequestModel {
  final String frameId;
  final String objectKey;
  final PhotoShareType photoShareType;
  final String expireAt;

  const Save4cutPhotosRequestModel(
    this.frameId,
    this.objectKey,
    this.photoShareType,
    this.expireAt,
  );

  factory Save4cutPhotosRequestModel.fromJson(Map<String, dynamic> json) =>
      _$Save4cutPhotosRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$Save4cutPhotosRequestModelToJson(this);

  Save4cutPhotosRequestEntity toEntity() {
    return Save4cutPhotosRequestEntity(
      frameId,
      objectKey,
      photoShareType,
      expireAt,
    );
  }
}
