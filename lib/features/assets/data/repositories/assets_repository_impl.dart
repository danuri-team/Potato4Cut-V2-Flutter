import 'package:potato_4cut_v2/features/assets/data/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/features/assets/domain/entities/profile_preset_entity.dart';
import 'package:potato_4cut_v2/features/assets/domain/repositories/assets_repository.dart';

class AssetsRepositoryImpl implements AssetsRepository{
  final AssetsDataSource _dataSource;

  const AssetsRepositoryImpl(this._dataSource);

  @override
  Future<ProfilePresetEntity> getProfilePreset() async{
    final response = await _dataSource.getProfilePreset();
    return response.toEntity();
  }
}