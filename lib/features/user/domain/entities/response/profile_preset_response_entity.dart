class ProfilePresetResponseEntity {
  final bool success;
  final List<ProfilePresetDataEntity> data;

  const ProfilePresetResponseEntity({required this.success, required this.data});
}

class ProfilePresetDataEntity {
  final String id;
  final String title;
  final String imgUrl;

  const ProfilePresetDataEntity({
    required this.id,
    required this.title,
    required this.imgUrl,
  });
}
