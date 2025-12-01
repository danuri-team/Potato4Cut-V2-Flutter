class LoginEntity {
  final String provider;
  final String oauthToken;
  final String deviceToken;

  const LoginEntity({
    required this.provider,
    required this.oauthToken,
    required this.deviceToken,
  });
}
