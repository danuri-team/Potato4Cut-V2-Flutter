import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/login_response_entity.dart';
import 'package:potato_4cut_v2/features/user/domain/repositories/users_repository.dart';

class LoginUseCase {
  final UsersRepository repository;

  const LoginUseCase(this.repository);

  Future<LoginResponseEntity> login(
    AuthProviderType provider,
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
