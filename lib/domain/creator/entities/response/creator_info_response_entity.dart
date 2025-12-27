class CreatorInfoResponseEntity {
  final bool success;
  final CreatorInfoDataEntity data;

  const CreatorInfoResponseEntity({
    required this.success,
    required this.data,
  });
}

class CreatorInfoDataEntity {
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

  const CreatorInfoDataEntity({
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
}
