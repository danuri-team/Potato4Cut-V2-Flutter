import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/photos/entites/response/save_4cut_photos_response_entity.dart';

part 'save_4cut_photos_response_model.g.dart';

@JsonSerializable()
class Save4cutPhotosResponseModel {
  final bool success;
  final Save4cutPhotosDataModel data;
  final String message;

  const Save4cutPhotosResponseModel(this.success, this.data, this.message);

  factory Save4cutPhotosResponseModel.fromJson(Map<String, dynamic> json) =>
      _$Save4cutPhotosResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$Save4cutPhotosResponseModelToJson(this);

  Save4cutPhotosResponseEntity toEntity(){
    final data = this.data.toEntity();
    return Save4cutPhotosResponseEntity(success, data, message);
  }
}

@JsonSerializable()
class Save4cutPhotosDataModel {
  final String photoId;
  final String composedImageUrl;
  String? frameId;
  String? frameTitle;

  Save4cutPhotosDataModel(
    this.photoId,
    this.composedImageUrl,
    this.frameId,
    this.frameTitle,
  );

  factory Save4cutPhotosDataModel.fromJson(Map<String, dynamic> json) =>
      _$Save4cutPhotosDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$Save4cutPhotosDataModelToJson(this);

  Save4cutPhotosDataEntity toEntity() {
    return Save4cutPhotosDataEntity(
      photoId,
      composedImageUrl,
      frameId,
      frameTitle,
    );
  }
}
