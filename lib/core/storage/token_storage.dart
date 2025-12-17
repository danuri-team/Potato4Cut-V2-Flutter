import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  final _accessTokenKey = 'accessToken';
  final _refreshTokenKey = 'refreshToken';
  final _tokenIssuanceDateKey = 'tokenIssuanceDate';

  Future<void> setAccessAndRefreshToken(
    String accessToken,
    String refreshToken,
  ) async {
    Future.wait([setAccessToken(accessToken), setRefreshToken(refreshToken)]);
  }

  Future<void> setAccessToken(String accessToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    final toDay = DateTime.now();
    await _storage.write(key: _tokenIssuanceDateKey, value: toDay.toString());
  }

  Future<String?> getAccessToken() async {
    final accessToken = await _storage.read(key: _accessTokenKey);
    return accessToken;
  }

  Future<String?> getRefreshToken() async {
    final refreshToken = await _storage.read(key: _refreshTokenKey);
    return refreshToken;
  }

  Future<bool> checkTokenExpiration() async {
    final tokenIssuanceDate = await _storage.read(key: _tokenIssuanceDateKey);
    final toDay = DateTime.now();

    if (tokenIssuanceDate == null) {
      return true;
    }

    final int differenceDay = toDay
        .difference(DateTime.parse(tokenIssuanceDate))
        .inDays;

    if(differenceDay < 7){
      return true;
    }else{
      return false;
    }
  }
}
