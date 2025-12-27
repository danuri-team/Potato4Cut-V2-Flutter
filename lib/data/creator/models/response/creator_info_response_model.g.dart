// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorInfoResponseModel _$CreatorInfoResponseModelFromJson(
  Map<String, dynamic> json,
) => CreatorInfoResponseModel(
  success: json['success'] as bool,
  data: CreatorInfoDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreatorInfoResponseModelToJson(
  CreatorInfoResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

CreatorInfoDataModel _$CreatorInfoDataModelFromJson(
  Map<String, dynamic> json,
) => CreatorInfoDataModel(
  creatorId: json['creatorId'] as String,
  userId: json['userId'] as String,
  nickname: json['nickname'] as String,
  profileImageUrl: json['profileImageUrl'] as String?,
  status: json['status'] as String,
  rejectionReason: json['rejectionReason'] as String?,
  appliedAt: json['appliedAt'] as String,
  approvedAt: json['approvedAt'] as String?,
  totalFrames: (json['totalFrames'] as num).toInt(),
  totalDownloads: (json['totalDownloads'] as num).toInt(),
);

Map<String, dynamic> _$CreatorInfoDataModelToJson(
  CreatorInfoDataModel instance,
) => <String, dynamic>{
  'creatorId': instance.creatorId,
  'userId': instance.userId,
  'nickname': instance.nickname,
  'profileImageUrl': instance.profileImageUrl,
  'status': instance.status,
  'rejectionReason': instance.rejectionReason,
  'appliedAt': instance.appliedAt,
  'approvedAt': instance.approvedAt,
  'totalFrames': instance.totalFrames,
  'totalDownloads': instance.totalDownloads,
};
