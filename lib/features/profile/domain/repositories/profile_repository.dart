import 'package:potato_4cut_v2/features/profile/domain/entities/get_my_info_entity.dart';

abstract class ProfileRepository {
  Future<GetMyInfoEntity> getMyInfo();
}