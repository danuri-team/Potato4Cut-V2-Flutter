import 'package:potato_4cut_v2/features/login/domain/entities/auth_result_entity.dart';
import 'package:potato_4cut_v2/features/login/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<AuthResultEntity> login(
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
