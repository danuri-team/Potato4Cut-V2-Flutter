import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/user_photos_response_entity.dart';

part 'user_photos_response_model.g.dart';

@JsonSerializable()
class UserPhotosResponseModel {
  final bool success;
  final UserPhotosDataModel data;

  const UserPhotosResponseModel(this.success, this.data);

  factory UserPhotosResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserPhotosResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPhotosResponseModelToJson(this);

  UserPhotosResponseEntity toEntity() {
    final data = this.data.toEntity();
    return UserPhotosResponseEntity(success, data);
  }
}

@JsonSerializable()
class UserPhotosDataModel {
  final List<UserPhotoModel> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const UserPhotosDataModel(
    this.content,
    this.currentPage,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
    this.hasNext,
    this.hasPrevious,
  );

  factory UserPhotosDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserPhotosDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPhotosDataModelToJson(this);

  UserPhotosDataEntity toEntity() {
    return UserPhotosDataEntity(
      content.map((e) => e.toEntity()).toList(),
      currentPage,
      pageSize,
      totalElements,
      totalPages,
      first,
      last,
      hasNext,
      hasPrevious,
    );
  }
}

@JsonSerializable()
class UserPhotoModel {
  final String id;
  final String imageUrl;
  final String frameId;
  final DateTime createdAt;

  const UserPhotoModel(
    this.id,
    this.imageUrl,
    this.frameId,
    this.createdAt,
  );

  factory UserPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$UserPhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPhotoModelToJson(this);

  UserPhotoEntity toEntity() {
    return UserPhotoEntity(id, imageUrl, frameId, createdAt);
  }
}
