import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/data/creator/data_sources/creator_data_source.dart';
import 'package:potato_4cut_v2/data/creator/data_sources/creator_data_source_impl.dart';
import 'package:potato_4cut_v2/data/creator/repositories/creator_repository_impl.dart';
import 'package:potato_4cut_v2/domain/creator/repositories/creator_repository.dart';
import 'package:potato_4cut_v2/domain/creator/use_cases/creator_use_cases.dart';
import 'package:potato_4cut_v2/domain/creator/use_cases/get_my_info_use_case.dart';
import 'package:potato_4cut_v2/domain/creator/use_cases/register_creator_use_case.dart';

final creatorDataSourceProvider = Provider<CreatorDataSource>(
  (ref) => CreatorDataSourceImpl(null),
);

final creatorRepositoryProvider = Provider<CreatorRepository>((ref) {
  final dataSource = ref.watch(creatorDataSourceProvider);
  return CreatorRepositoryImpl(dataSource);
});

final creatorUseCasesProvider = Provider<CreatorUseCases>((ref) {
  final repository = ref.watch(creatorRepositoryProvider);
  final registerCreator = RegisterCreatorUseCase(repository);
  final getMyInfo = GetMyInfoUseCase(repository);
  return CreatorUseCases(registerCreator, getMyInfo);
});

final creatorViewModelProvider =
    StateNotifierProvider<CreatorViewModelNotifier, CreatorUseCases>((ref) {
      final useCases = ref.watch(creatorUseCasesProvider);
      return CreatorViewModelNotifier(useCases);
    });

class CreatorViewModelNotifier extends StateNotifier<CreatorUseCases> {
  CreatorViewModelNotifier(super._useCases);

  Future registerCreator() async {
    final response = await state.registerCreatorUseCase.registerCreator();
    return response;
  }

  Future getMyInfo() async {
    final response = await state.getMyInfoUseCase.getMyInfo();
    return response;
  }
}
