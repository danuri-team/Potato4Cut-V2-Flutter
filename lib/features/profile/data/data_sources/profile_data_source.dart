import 'package:potato_4cut_v2/features/profile/data/models/get_my_info_response_model.dart';

abstract class ProfileDataSource {
  Future<GetMyInfoResponseModel> getMyInfo();
}