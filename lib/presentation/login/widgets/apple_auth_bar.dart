import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/presentation/sign_up/providers/auth_state.dart';
import 'package:potato_4cut_v2/presentation/view_models/users_view_model.dart';

class AppleAuthBar extends ConsumerWidget {
  const AppleAuthBar({super.key});

  Future<void> appleLogin(
    WidgetRef ref,
    BuildContext context,
    AuthState authState,
  ) async {
    try {
      await ref.read(usersProvider.notifier).loginWithApple();

      final status = ref.read(usersProvider).status;
      if (status == AuthStatus.authenticated) {
        if (!context.mounted) return;
        if (authState.newUser == true) {
          AppNavigation.goSignUpStep1(context);
        } else if (authState.newUser == false) {
          AppNavigation.goHome(context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Apple 로그인 실패: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(usersProvider);
    final isLoading = authState.isLoadingFor(AuthProviderType.APPLE);

    return GestureDetector(
      onTap: authState.isLoading
          ? null
          : () async {
              await appleLogin(ref, context, authState);
            },
      child: Container(
        width: 345.w,
        height: 48.h,
        decoration: ShapeDecoration(
          color: isLoading ? AppColor.line2 : AppColor.background1,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.line2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: const CircularProgressIndicator(strokeWidth: 2),
              )
            else
              SvgPicture.asset('assets/images/apple_auth_logo.svg'),
            SizedBox(width: 6.w),
            Text(
              isLoading ? '로그인 중...' : 'Apple로 계속하기',
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
