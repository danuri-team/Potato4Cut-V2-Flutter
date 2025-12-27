import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/creator/entities/response/creator_info_response_entity.dart';

part 'creator_info_response_model.g.dart';

@JsonSerializable()
class CreatorInfoResponseModel {
  final bool success;
  final CreatorInfoDataModel data;

  const CreatorInfoResponseModel({
    required this.success,
    required this.data,
  });

  factory CreatorInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorInfoResponseModelToJson(this);

  CreatorInfoResponseEntity toEntity() {
    return CreatorInfoResponseEntity(
      success: success,
      data: data.toEntity(),
    );
  }
}

@JsonSerializable()
class CreatorInfoDataModel {
  final String creatorId;
  final String userId;
  final String nickname;
  final String? profileImageUrl;
  final String status;
  final String? rejectionReason;
  final String appliedAt;
  final String? approvedAt;
  final int totalFrames;
  final int totalDownloads;

  const CreatorInfoDataModel({
    required this.creatorId,
    required this.userId,
    required this.nickname,
    this.profileImageUrl,
    required this.status,
    this.rejectionReason,
    required this.appliedAt,
    this.approvedAt,
    required this.totalFrames,
    required this.totalDownloads,
  });

  factory CreatorInfoDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorInfoDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorInfoDataModelToJson(this);

  CreatorInfoDataEntity toEntity() {
    return CreatorInfoDataEntity(
      creatorId: creatorId,
      userId: userId,
      nickname: nickname,
      profileImageUrl: profileImageUrl,
      status: status,
      rejectionReason: rejectionReason,
      appliedAt: appliedAt,
      approvedAt: approvedAt,
      totalFrames: totalFrames,
      totalDownloads: totalDownloads,
    );
  }
}
