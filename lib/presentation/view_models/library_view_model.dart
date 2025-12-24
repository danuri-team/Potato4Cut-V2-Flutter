import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/data/library/data_sources/library_data_source.dart';
import 'package:potato_4cut_v2/data/library/data_sources/library_data_source_impl.dart';
import 'package:potato_4cut_v2/data/library/repositories/library_repository_impl.dart';
import 'package:potato_4cut_v2/domain/library/entities/response/possession_products_response_entity.dart';
import 'package:potato_4cut_v2/domain/library/repositories/library_repository.dart';
import 'package:potato_4cut_v2/domain/library/use_cases/add_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/library/use_cases/delete_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/library/use_cases/get_possession_products_use_case.dart';
import 'package:potato_4cut_v2/domain/library/use_cases/library_use_cases.dart';
import 'package:potato_4cut_v2/domain/library/use_cases/onoff_bookmark_use_case.dart';
import 'package:potato_4cut_v2/domain/library/use_cases/use_frame_use_case.dart';

final libraryDataSourceProvider = Provider<LibraryDataSource>(
  (ref) => LibraryDataSourceImpl(null),
);

final libraryRepositoryProvider = Provider<LibraryRepository>((ref) {
  final dataSource = ref.watch(libraryDataSourceProvider);
  return LibraryRepositoryImpl(dataSource: dataSource);
});

final libraryUseCasesProvider = Provider<LibraryUseCases>((ref) {
  final repository = ref.watch(libraryRepositoryProvider);
  final addFrame = AddFrameUseCase(repository);
  final getPossessionProducts = GetPossessionProductsUseCase(repository);
  final useFrame = UseFrameUseCase(repository);
  final onoffBookmark = OnoffBookmarkUseCase(repository);
  final deleteFrame = DeleteFrameUseCase(repository);
  return LibraryUseCases(
    addFrame,
    getPossessionProducts,
    useFrame,
    onoffBookmark,
    deleteFrame,
  );
});

final libraryViewModelProvider =
    StateNotifierProvider<LibraryViewModelNotifier, LibraryUseCases>((ref) {
      final useCases = ref.watch(libraryUseCasesProvider);
      return LibraryViewModelNotifier(useCases);
    });

class LibraryViewModelNotifier extends StateNotifier<LibraryUseCases> {
  LibraryViewModelNotifier(super._useCases);

  Future addFrame(String frameId) async {
    final response = await state.addFrame.addFrame(frameId);
    return response;
  }

  Future<PossessionProductsResponseEntity> getPossessionProducts(
    bool bookmarkedOnly,
    int page,
    int size,
    SortbyType sortBy,
    DirectionType direction,
  ) async {
    final response = await state.getPossessionProducts.getPossessionProducts(
      bookmarkedOnly,
      page,
      size,
      sortBy,
      direction,
    );
    return response;
  }

  Future useFrame(String frameId) async {
    final response = await state.useFrame.useFrame(frameId);
    return response;
  }

  Future onoffBookmark(String frameId) async {
    final response = await state.onoffBookmark.onoffBookmark(frameId);
    return response;
  }

  Future<void> deleteFrame(String frameId) async {
    await state.deleteFrame.deleteFrame(frameId);
  }
}
