import 'package:potato_4cut_v2/data/common/models/response/success_response_model.dart';
import 'package:potato_4cut_v2/data/creator/models/response/creator_info_response_model.dart';

abstract class CreatorDataSource {
  Future<SuccessResponseModel> registerCreator();
  Future<CreatorInfoResponseModel> getMyInfo();
}
