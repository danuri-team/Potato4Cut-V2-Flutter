import 'dart:io';

import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/profile_preset_response_entity.dart';
import 'package:potato_4cut_v2/features/user/data/data_sources/users_data_source.dart';
import 'package:potato_4cut_v2/features/user/data/models/request/login_request_model.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/login_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/token_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/repositories/users_repository.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/get_my_info_response_entity.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource _dataSource;

  UsersRepositoryImpl(this._dataSource);

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

      final response = await _dataSource.login(request);

      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MyInfoDataEntity> profileUpdate(String nickname, String? bio, String profilePresetId, File? profileImage) async{
    final response = await _dataSource.profileUpdate(nickname, bio, profilePresetId, profileImage);
    return response.toEntity();
  }

  @override
  Future<GetMyInfoResponseEntity> getMyInfo() async{
    final response = await _dataSource.getMyInfo();
    return response.toEntity();
  }

  @override
  Future<TokenResponseEntity> refreshToken(String refreshToken) async {
    try {
      final response = await _dataSource.refreshToken(refreshToken);

      return TokenResponseEntity(
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
      await _dataSource.logout();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfilePresetEntity> getProfilePreset() async{
    final response = await _dataSource.getProfilePreset();
    return response.toEntity();
  }
}
