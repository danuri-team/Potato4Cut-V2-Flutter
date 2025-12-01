import 'package:potato_4cut_v2/features/login/domain/entities/auth_result_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/auth_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository repository;

  const RefreshTokenUseCase(this.repository);

  Future<AuthResultEntity> refreshToken(String refreshToken) async {
    final response = await repository.refreshToken(refreshToken);
    return response;
  }
}
