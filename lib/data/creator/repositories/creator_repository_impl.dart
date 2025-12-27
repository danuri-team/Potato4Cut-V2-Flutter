import 'package:potato_4cut_v2/data/creator/data_sources/creator_data_source.dart';
import 'package:potato_4cut_v2/domain/common/entities/response/success_response_entity.dart';
import 'package:potato_4cut_v2/domain/creator/entities/response/creator_info_response_entity.dart';
import 'package:potato_4cut_v2/domain/creator/repositories/creator_repository.dart';

class CreatorRepositoryImpl implements CreatorRepository {
  final CreatorDataSource _dataSource;

  CreatorRepositoryImpl(this._dataSource);

  @override
  Future<SuccessResponseEntity> registerCreator() async {
    final response =  await _dataSource.registerCreator();
    return response.toEntity();
  }

  @override
  Future<CreatorInfoResponseEntity> getMyInfo() async {
    final response = await _dataSource.getMyInfo();
    return response.toEntity();
  }
}
