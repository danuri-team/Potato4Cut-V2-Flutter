import 'package:potato_4cut_v2/domain/common/entities/response/success_response_entity.dart';
import 'package:potato_4cut_v2/domain/creator/entities/response/creator_info_response_entity.dart';

abstract class CreatorRepository {
  Future<SuccessResponseEntity> registerCreator();
  Future<CreatorInfoResponseEntity> getMyInfo();
}
