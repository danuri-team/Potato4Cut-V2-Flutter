import 'dart:io';

import 'package:potato_4cut_v2/features/user/data/models/get_my_info_response_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/login_request_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/login_response_model.dart';
import 'package:potato_4cut_v2/features/user/data/models/token_response_model.dart';

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
}