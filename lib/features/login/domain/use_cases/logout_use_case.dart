import 'package:potato_4cut_v2/features/login/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  const LogoutUseCase(this.repository);

  Future<void> logout() async{
    await repository.logout();
  }
}