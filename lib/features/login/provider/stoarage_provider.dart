
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/features/login/provider/auth_state.dart';

final storageProvider =
    StateNotifierProvider<StoarageNotifier, FlutterSecureStorage>(
      (ref) => StoarageNotifier(),
    );

class StoarageNotifier extends StateNotifier<FlutterSecureStorage> {
  StoarageNotifier() : super(const FlutterSecureStorage());

  final storageKey = 'authStatus';

  Future<void> checkAuthAndNavigate(BuildContext context) async {
    final authStatusString = await state.read(key: storageKey);

    if(!context.mounted) return;

    if (authStatusString == null || authStatusString == AuthStatus.unauthenticated.toString()) {
        AppNavigation.goLogin(context);
    } else if (authStatusString == AuthStatus.authenticated.toString()) {
        AppNavigation.goHome(context);
    }
  }

  Future<void> login() async{
    await state.write(key: storageKey, value: AuthStatus.authenticated.toString());
  }

  Future<void> logout() async{
    await state.write(key: storageKey, value: AuthStatus.unauthenticated.toString());
  }
}
