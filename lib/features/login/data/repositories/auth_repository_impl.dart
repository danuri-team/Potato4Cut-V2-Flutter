import 'dart:io';

import 'package:potato_4cut_v2/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:potato_4cut_v2/features/login/data/models/login_request_dto.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/auth_result_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<AuthResultEntity> login({
    required String provider,
    required String token,
    required String deviceToken,
  }) async {
    try {
      final request = LoginRequestDto(
        provider: provider,
        oauthToken: token,
        deviceToken: deviceToken,
      );

      final response = await _remoteDataSource.login(request);

      return AuthResultEntity(
        accessToken: response.token.accessToken,
        refreshToken: response.token.refreshToken,
        user: response.toEntity(),
        newUser: response.newUser,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future profileUpdate(String nickname, String? bio, String profilePresetId, File? profileImage) async{
    final response = _remoteDataSource.profileUpdate(nickname, bio, profilePresetId, profileImage);
    return response;
  }

  @override
  Future<AuthResultEntity> refreshToken(String refreshToken) async {
    try {
      final response = await _remoteDataSource.refreshToken(refreshToken);

      return AuthResultEntity(
        accessToken: response.token.accessToken,
        refreshToken: response.token.refreshToken,
        user: response.toEntity(),
        newUser: response.newUser,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (e) {
      rethrow;
    }
  }
}
