class LoginResultEntity {
  final String userId;
  final String nickname;
  final String email;
  String? profileImageUrl;
  final String role;
  final TokenEntity token;
  final bool newUser;

  LoginResultEntity({
    required this.userId,
    required this.nickname,
    required this.email,
    this.profileImageUrl,
    required this.role,
    required this.token,
    required this.newUser,
  });
}

class TokenEntity {
  final String accessToken;
  final String refreshToken;

  const TokenEntity({required this.accessToken, required this.refreshToken});
}
