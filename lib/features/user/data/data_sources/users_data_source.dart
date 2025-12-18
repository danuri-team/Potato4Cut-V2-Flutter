import 'dart:io';

import 'package:potato_4cut_v2/features/user/data/models/response/profile_preset_response_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/response/get_my_info_response_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/request/login_request_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/response/login_response_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/request/token_response_model.dart';

abstract class UsersDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
  Future<MyInfoDataModel> profileUpdate(
    String nickname,
    String? bio,
    String profilePresetId,
    File? profileImage,
  );
  Future<GetMyInfoResponseModel> getMyInfo();
  Future<TokenModel> refreshToken(String refreshToken);
  Future<void> logout();
  Future<ProfilePresetResponseModel> getProfilePreset();
}