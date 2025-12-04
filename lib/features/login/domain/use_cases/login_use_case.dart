import 'package:potato_4cut_v2/features/login/domain/entities/login_response_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/users_repository.dart';

class LoginUseCase {
  final UsersRepository repository;

  const LoginUseCase(this.repository);

  Future<LoginResponseEntity> login(
    String provider,
    String token,
    String deviceToken,
  ) async {
    final response = await repository.login(
      provider: provider,
      token: token,
      deviceToken: deviceToken,
    );
    return response;
  }
}
