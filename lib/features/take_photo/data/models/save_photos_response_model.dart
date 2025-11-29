import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entities/save_photos_entity.dart';

part 'save_photos_response_model.g.dart';

@JsonSerializable()
class SavePhotosResponseModel {
  final bool success;
  final List<PhotoDataModel> data;
  final String message;

  const SavePhotosResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory SavePhotosResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SavePhotosResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavePhotosResponseModelToJson(this);

  SavePhotosEntity toEntity(){
    final List<PhotoDataEntity> data = [];
    for (var photoDataModel in this.data) {
      data.add(photoDataModel.toEntity());
    }
    return SavePhotosEntity(success: success, data: data, message: message);
  }
}

@JsonSerializable()
class PhotoDataModel {
  final String cutId;
  final int cutOrder;
  final String originalImageUrl;

  const PhotoDataModel({
    required this.cutId,
    required this.cutOrder,
    required this.originalImageUrl,
  });

  factory PhotoDataModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDataModelToJson(this);

  PhotoDataEntity toEntity() {
    return PhotoDataEntity(
      cutId: cutId,
      cutOrder: cutOrder,
      originalImageUrl: originalImageUrl,
    );
  }
}
