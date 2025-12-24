import 'package:potato_4cut_v2/data/assets/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/domain/assets/repositories/assets_repository.dart';
import 'package:potato_4cut_v2/domain/assets/entities/profile_preset_response_entity.dart';

class AssetsRepositoryImpl implements AssetsRepository{
  final AssetsDataSource _dataSource;

  AssetsRepositoryImpl(this._dataSource);

  @override
  Future<ProfilePresetResponseEntity> getProfilePreset() async {
    final response = await _dataSource.getProfilePreset();
    return response.toEntity();
  }
}