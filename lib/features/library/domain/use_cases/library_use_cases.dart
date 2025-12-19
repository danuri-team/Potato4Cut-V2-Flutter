import 'package:potato_4cut_v2/features/library/domain/use_cases/add_frame_use_case.dart';
import 'package:potato_4cut_v2/features/library/domain/use_cases/delete_frame_use_case.dart';
import 'package:potato_4cut_v2/features/library/domain/use_cases/get_possession_products_use_case.dart';
import 'package:potato_4cut_v2/features/library/domain/use_cases/onoff_bookmark_use_case.dart';
import 'package:potato_4cut_v2/features/library/domain/use_cases/use_frame_use_case.dart';

class LibraryUseCases {
  final AddFrameUseCase addFrame;
  final GetPossessionProductsUseCase getPossessionProducts;
  final UseFrameUseCase useFrame;
  final OnoffBookmarkUseCase onoffBookmark;
  final DeleteFrameUseCase deleteFrame;

  const LibraryUseCases(
    this.addFrame,
    this.getPossessionProducts,
    this.useFrame,
    this.onoffBookmark,
    this.deleteFrame,
  );
}
