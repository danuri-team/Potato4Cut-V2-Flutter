class LoginRequestEntity {
  final String provider;
  final String oauthToken;
  final String deviceToken;

  const LoginRequestEntity({
    required this.provider,
    required this.oauthToken,
    required this.deviceToken,
  });
}
