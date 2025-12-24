import 'package:potato_4cut_v2/data/users/models/request/profile_update_request_model.dart';
import 'package:potato_4cut_v2/data/users/models/response/my_info_response_model.dart';
import 'package:potato_4cut_v2/data/users/models/request/login_request_model.dart';
import 'package:potato_4cut_v2/data/users/models/response/login_response_model.dart';
import 'package:potato_4cut_v2/data/users/models/request/token_response_model.dart';

abstract class UsersDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
  Future<MyInfoDataModel> profileUpdate(ProfileUpdateRequestModel request);
  Future<MyInfoResponseModel> getMyInfo();
  Future<TokenModel> refreshToken(String refreshToken);
  Future<void> logout();
}
