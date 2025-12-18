import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/features/user/data/models/request/profile_update_request_model.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/request/profile_update_request_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/profile_preset_response_entity.dart';
import 'package:potato_4cut_v2/features/user/data/data_sources/users_data_source.dart';
import 'package:potato_4cut_v2/features/user/data/models/request/login_request_model.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/login_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/token_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/repositories/users_repository.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/my_info_response_entity.dart';

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
  Future<MyInfoDataEntity> profileUpdate(
    ProfileUpdateRequestEntity request,
  ) async {
    final requestModel = ProfileUpdateRequestModel(
      request.nickname,
      request.bio,
      request.profilePresetId,
      request.profileImageKey,
    );
    final response = await _dataSource.profileUpdate(requestModel);
    return response.toEntity();
  }

  @override
  Future<MyInfoResponseEntity> getMyInfo() async {
    final response = await _dataSource.getMyInfo();
    return response.toEntity();
  }

  @override
  Future<TokenResponseEntity> refreshToken(String refreshToken) async {
    try {
      final response = await _dataSource.refreshToken(refreshToken);

      return TokenResponseEntity(response.accessToken, response.refreshToken);
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
  Future<ProfilePresetResponseEntity> getProfilePreset() async {
    final response = await _dataSource.getProfilePreset();
    return response.toEntity();
  }
}
