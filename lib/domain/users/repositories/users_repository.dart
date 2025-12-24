import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/domain/users/entities/request/profile_update_request_entity.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/login_response_entity.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/my_info_response_entity.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/token_response_entity.dart';

abstract class UsersRepository {
  Future<LoginResponseEntity> login({
    required AuthProviderType provider,
    required String token,
    required String deviceToken,
  });

  Future<MyInfoDataEntity> profileUpdate(ProfileUpdateRequestEntity request);

  Future<MyInfoResponseEntity> getMyInfo();

  Future<TokenResponseEntity> refreshToken(String refreshToken);

  Future<void> logout();
}
