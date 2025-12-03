import 'package:potato_4cut_v2/features/profile/data/data_sources/profile_data_source.dart';
import 'package:potato_4cut_v2/features/profile/domain/entities/get_my_info_entity.dart';
import 'package:potato_4cut_v2/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileDataSource _dataSource;

  const ProfileRepositoryImpl(this._dataSource);

  @override
  Future<GetMyInfoEntity> getMyInfo() async{
    final response = await _dataSource.getMyInfo();
    return response.toEntity();
  }
}