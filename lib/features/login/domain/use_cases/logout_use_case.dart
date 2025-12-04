import 'package:potato_4cut_v2/features/login/domain/repositories/users_repository.dart';

class LogoutUseCase {
  final UsersRepository repository;

  const LogoutUseCase(this.repository);

  Future<void> logout() async{
    await repository.logout();
  }
}