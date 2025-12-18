class UserDto {
  final String userId;
  final String nickname;
  final String email;
  final String? profileImageUrl;
  final String role;

  const UserDto({
    required this.userId,
    required this.nickname,
    required this.email,
    this.profileImageUrl,
    required this.role,
  });
}
