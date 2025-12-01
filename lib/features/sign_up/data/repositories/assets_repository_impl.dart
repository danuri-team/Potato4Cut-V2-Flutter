import 'package:potato_4cut_v2/features/sign_up/data/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/features/sign_up/domain/entities/profile_preset_entity.dart';
import 'package:potato_4cut_v2/features/sign_up/domain/repositories/assets_repository.dart';

class AssetsRepositoryImpl implements AssetsRepository {
  final AssetsDataSource _dataSource;

  const AssetsRepositoryImpl({required AssetsDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<ProfilePresetEntity> getProfilePreset() async{
    final response = await _dataSource.getProfilePreset();
    return response.toEntity();
  }
}
