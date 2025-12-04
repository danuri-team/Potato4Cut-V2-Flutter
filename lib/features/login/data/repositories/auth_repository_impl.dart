import 'dart:io';

import 'package:potato_4cut_v2/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:potato_4cut_v2/features/login/data/models/login_request_dto.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/auth_result_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/login_result_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/auth_repository.dart';
import 'package:potato_4cut_v2/features/profile/domain/entities/get_my_info_entity.dart';

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
  Future<MyInfoDataEntity> profileUpdate(String nickname, String? bio, String profilePresetId, File? profileImage) async{
    final response = await _remoteDataSource.profileUpdate(nickname, bio, profilePresetId, profileImage);
    return response.toEntity();
  }

  @override
  Future<TokenEntity> refreshToken(String refreshToken) async {
    try {
      final response = await _remoteDataSource.refreshToken(refreshToken);

      return TokenEntity(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
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
