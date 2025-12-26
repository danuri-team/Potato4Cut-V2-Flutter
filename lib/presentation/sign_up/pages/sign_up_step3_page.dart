import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/sign_up/providers/sign_up_field_provider.dart';

class SignUpStep3Page extends ConsumerWidget {
  const SignUpStep3Page({super.key});

  void submit(WidgetRef ref, BuildContext context) {
    Throttle.run(() {
      AppNavigation.goHome(context);
    });
    ref.read(signUpFieldProvider.notifier).resetField();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appBar: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: CustomBackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            'assets/images/welcome_message.svg',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 42.h),
          SvgPicture.asset('assets/images/welcome_image.svg'),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SubmitButton(
              onTap: () => submit(ref, context),
              width: 343.w,
              text: '감자네컷 시작하기',
              isActivate: true,
              suffixSvg: SvgPicture.asset(
                'assets/images/chevron_right.svg',
                colorFilter: ColorFilter.mode(AppColor.static1, BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
