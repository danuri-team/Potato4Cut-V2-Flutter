import 'dart:io';

import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/features/login/data/data_sources/users_data_source.dart';
import 'package:potato_4cut_v2/features/login/data/models/login_request_model.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/login_response_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/token_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/users_repository.dart';
import 'package:potato_4cut_v2/features/login/domain/entities/get_my_info_entity.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource _remoteDataSource;

  UsersRepositoryImpl(this._remoteDataSource);

  @override
  Future<LoginResponseEntity> login({
    required AuthProviderType provider,
    required String token,
    required String deviceToken,
  }) async {
    try {
      final request = LoginRequestModel(
        provider: provider,
        oauthToken: token,
        deviceToken: deviceToken,
      );

      final response = await _remoteDataSource.login(request);

      return response.toEntity();
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
  Future<GetMyInfoEntity> getMyInfo() async{
    final response = await _remoteDataSource.getMyInfo();
    return response.toEntity();
  }

  @override
  Future<TokenEntity> refreshToken(String refreshToken) async {
    try {
      final response = await _remoteDataSource.refreshToken(refreshToken);

      return TokenEntity(
        response.accessToken,
        response.refreshToken,
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
