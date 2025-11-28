import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/sign_up/presentation/widgets/sign_up_text_form_field.dart';
import 'package:potato_4cut_v2/features/sign_up/provider/sign_up_field_provider.dart';

class SignUpStep1Page extends ConsumerWidget {
  const SignUpStep1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpField = ref.watch(signUpFieldProvider);
    final nickname = signUpField.nickname;

    return DefaultLayout(
      appBar: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: SvgPicture.asset('assets/images/chevron_left.svg'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$nickname'),
              SizedBox(height: 48.h),
              Text('닉네임을 입력해주세요', style: AppTextStyle.heading1),
              SizedBox(height: 20.h),
              const SignUpTextFormField(),
              SizedBox(height: 478.h),
              SubmitButton(
                onTap: () =>
                    Throttle.run(() => AppNavigation.goSignUpStep2(context)),
                width: 343.w,
                text: '확인',
                isActivate: (nickname != null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
