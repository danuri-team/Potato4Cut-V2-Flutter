import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/features/sign_up/data/data_sources/assets_data_source.dart';
import 'package:potato_4cut_v2/features/sign_up/data/data_sources/assets_data_source_impl.dart';
import 'package:potato_4cut_v2/features/sign_up/data/repositories/assets_repository_impl.dart';
import 'package:potato_4cut_v2/features/sign_up/domain/entities/profile_preset_entity.dart';
import 'package:potato_4cut_v2/features/sign_up/domain/repositories/assets_repository.dart';
import 'package:potato_4cut_v2/features/sign_up/domain/use_cases/get_profile_preset.dart';

final _assetsDataSourceProvider = Provider<AssetsDataSource>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return AssetsDataSourceImpl(dio: dio);
  },
);

final _assetsRepositoryProvider = Provider<AssetsRepository>((ref) {
  final dataSource = ref.watch(_assetsDataSourceProvider);
  return AssetsRepositoryImpl(dataSource);
});

final _getProfilePresetUseCaseProvider = Provider<GetProfilePreset>((ref) {
  final repository = ref.watch(_assetsRepositoryProvider);
  return GetProfilePreset(repository);
});

final assetsViewModelProvider =
    StateNotifierProvider<AssetsViewModelNotifier, GetProfilePreset>((ref) {
      final useCase = ref.watch(_getProfilePresetUseCaseProvider);
      return AssetsViewModelNotifier(useCase);
    });

class AssetsViewModelNotifier extends StateNotifier<GetProfilePreset> {
  AssetsViewModelNotifier(super.useCase);

  Future<ProfilePresetEntity> getProrilePreset() async {
    final response = await state.getProfilePreset();
    return response;
  }
}
