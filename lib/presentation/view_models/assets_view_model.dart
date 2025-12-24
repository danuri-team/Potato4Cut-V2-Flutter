import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/data/assets/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/data/assets/data_sources/assets_data_source_impl.dart';
import 'package:potato_4cut_v2/data/assets/repositories/assets_repository_impl.dart';
import 'package:potato_4cut_v2/domain/assets/entities/profile_preset_response_entity.dart';
import 'package:potato_4cut_v2/domain/assets/repositories/assets_repository.dart';
import 'package:potato_4cut_v2/domain/assets/use_cases/get_profile_preset_use_case.dart';

final assetsDataSourceProvider = Provider<AssetsDataSource>(
  (ref) => AssetsDataSourceImpl(null),
);

final assetsRepositoryProvider = Provider<AssetsRepository>((ref) {
  final dataSource = ref.watch(assetsDataSourceProvider);
  return AssetsRepositoryImpl(dataSource);
});

final assetsUseCaseProvider = Provider<GetProfilePresetUseCase>((ref) {
  final repository = ref.watch(assetsRepositoryProvider);
  return GetProfilePresetUseCase(repository);
});

final assetsViewModelProvider = StateNotifierProvider<AssetsViewModelNotifier, GetProfilePresetUseCase>((ref) { 
  final useCase = ref.watch(assetsUseCaseProvider);
  return AssetsViewModelNotifier(useCase);
  });

class AssetsViewModelNotifier extends StateNotifier<GetProfilePresetUseCase>{
  AssetsViewModelNotifier(super.useCase);

  Future<ProfilePresetResponseEntity> getProfilePreset() async{
    final response = await state.getProfilePreset();
    return response;
  } 
}