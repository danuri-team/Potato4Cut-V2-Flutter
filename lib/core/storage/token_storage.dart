import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  final _accessTokenKey = 'accessToken';
  final _refreshTokenKey = 'refreshToken';

  Future<void> setAccessAndRefreshToken(String accessToken, String refreshToken) async{
    Future.wait([
    _storage.write(key: _accessTokenKey, value: accessToken),
    _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<void> setAccessToken(String accessToken) async{
   await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async{
    final accessToken = await _storage.read(key: _accessTokenKey);
    return accessToken;
  }

  Future<void> setRefreshToken(String refreshToken) async{
   await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getRefreshToken() async{
    final refreshToken = await _storage.read(key: _refreshTokenKey);
    return refreshToken;
  }
}