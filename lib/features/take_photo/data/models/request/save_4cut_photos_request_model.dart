import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/request/save_4cut_photos_request_entity.dart';

part 'save_4cut_photos_request_model.g.dart';

@JsonSerializable()
class Save4cutPhotosRequestModel {
  final String frameId;
  final String objectKey;

  const Save4cutPhotosRequestModel(this.frameId, this.objectKey);

  factory Save4cutPhotosRequestModel.fromJson(Map<String, dynamic> json) =>
      _$Save4cutPhotosRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$Save4cutPhotosRequestModelToJson(this);

  Save4cutPhotosRequestEntity toEntity(){
    return Save4cutPhotosRequestEntity(frameId, objectKey);
  }
}
