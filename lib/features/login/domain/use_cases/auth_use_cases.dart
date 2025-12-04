import 'package:potato_4cut_v2/features/login/domain/use_cases/get_my_info_use_case.dart';
import 'package:potato_4cut_v2/features/login/domain/use_cases/login_use_case.dart';
import 'package:potato_4cut_v2/features/login/domain/use_cases/logout_use_case.dart';
import 'package:potato_4cut_v2/features/login/domain/use_cases/profile_update_use_case.dart';
import 'package:potato_4cut_v2/features/login/domain/use_cases/refresh_token_use_case.dart';

class AuthUseCases {
  final LoginUseCase loginUseCase;
  final ProfileUpdateUseCase profileUpdateUseCase;
  final GetMyInfoUseCase getMyInfoUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final LogoutUseCase logoutUseCase;

  const AuthUseCases(
    this.loginUseCase,
    this.profileUpdateUseCase,
    this.getMyInfoUseCase,
    this.refreshTokenUseCase,
    this.logoutUseCase,
  );
}
