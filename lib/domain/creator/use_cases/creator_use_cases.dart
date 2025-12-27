import 'package:potato_4cut_v2/domain/creator/use_cases/get_my_info_use_case.dart';
import 'package:potato_4cut_v2/domain/creator/use_cases/register_creator_use_case.dart';

class CreatorUseCases {
  final RegisterCreatorUseCase registerCreatorUseCase;
  final GetMyInfoUseCase getMyInfoUseCase;

  const CreatorUseCases(this.registerCreatorUseCase, this.getMyInfoUseCase);
}
