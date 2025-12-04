import 'package:potato_4cut_v2/features/login/domain/entities/token_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/users_repository.dart';

class RefreshTokenUseCase {
  final UsersRepository repository;

  const RefreshTokenUseCase(this.repository);

  Future<TokenEntity> refreshToken(String refreshToken) async {
    final response = await repository.refreshToken(refreshToken);
    return response;
  }
}
