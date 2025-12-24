import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/view_models/users_view_model.dart';
import 'package:potato_4cut_v2/presentation/login/providers/stoarage_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WithdrawAndLogout extends ConsumerWidget {
  const WithdrawAndLogout({super.key});

  Future<void> logout(WidgetRef ref, BuildContext context) async {
    Throttle.run(() {
      Future.wait([
        ref.read(usersProvider.notifier).logout(),
        ref.read(storageProvider.notifier).logout(),
      ]);
      AppNavigation.goLogin(context);
    });
  }

  Future<void> withdraw(WidgetRef ref, BuildContext context) async {
    Throttle.run(() async {
      await ref.read(storageProvider.notifier).logout();
      launchUrl(
        Uri.parse(
          'https://docs.google.com/forms/d/e/1FAIpQLSfPIZTFkRChyt6ZqziaruC_DybLJRYEMasiNlycwJFeVgF9AA/viewform',
        ),
      );
      AppNavigation.goLogin(context);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 125.w,
      height: 14.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => withdraw(ref, context),
            child: Text(
              '회원 탈퇴',
              style: TextStyle(
                color: AppColor.label3,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
          VerticalDivider(
            color: AppColor.label2,
            width: 12.w,
            thickness: 1.h,
            indent: 3.h,
            endIndent: 3.h,
          ),
          GestureDetector(
            onTap: () => logout(ref, context),
            child: Text(
              '로그아웃',
              style: TextStyle(
                color: AppColor.label3,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
