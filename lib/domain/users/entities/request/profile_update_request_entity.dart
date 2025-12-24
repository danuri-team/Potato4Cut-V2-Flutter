class ProfileUpdateRequestEntity {
  final String nickname;
  String? bio;
  final String profilePresetId;
  final String profileImageKey;

  ProfileUpdateRequestEntity(
    this.nickname,
    this.bio,
    this.profilePresetId,
    this.profileImageKey,
  );
}