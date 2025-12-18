import 'package:potato_4cut_v2/features/user/domain/entities/response/token_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/repositories/users_repository.dart';

class RefreshTokenUseCase {
  final UsersRepository repository;

  const RefreshTokenUseCase(this.repository);

  Future<TokenResponseEntity> refreshToken(String refreshToken) async {
    final response = await repository.refreshToken(refreshToken);
    return response;
  }
}
