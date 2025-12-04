import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/features/profile/data/data_sources/profile_data_source.dart';
import 'package:potato_4cut_v2/features/profile/data/data_sources/profile_data_source_impl.dart';
import 'package:potato_4cut_v2/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:potato_4cut_v2/features/profile/domain/entities/get_my_info_entity.dart';
import 'package:potato_4cut_v2/features/profile/domain/repositories/profile_repository.dart';
import 'package:potato_4cut_v2/features/profile/domain/use_cases/get_my_info_use_case.dart';

final profileDataSourceProvider = Provider<ProfileDataSource>(
  (ref) => ProfileDataSourceImpl(null),
);

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dataSource = ref.watch(profileDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
});

final getMyInfoUseCase = Provider<GetMyInfoUseCase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetMyInfoUseCase(repository);
});

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModelNotifier, GetMyInfoUseCase>((ref) {
      final useCase = ref.watch(getMyInfoUseCase);
      return ProfileViewModelNotifier(useCase);
    });

class ProfileViewModelNotifier extends StateNotifier<GetMyInfoUseCase> {
  ProfileViewModelNotifier(super.useCase);

  Future<GetMyInfoEntity> getMyInfo() async {
    final response = await state.getMyInfo();
    return response;
  }
}
