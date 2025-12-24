import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/sign_up/widgets/sign_up_text_form_field.dart';
import 'package:potato_4cut_v2/presentation/sign_up/providers/sign_up_field_provider.dart';

class SignUpStep1Page extends ConsumerWidget {
  const SignUpStep1Page({super.key});

    void _resetState(WidgetRef ref) {
      ref.read(signUpFieldProvider.notifier).resetField();
    }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpField = ref.watch(signUpFieldProvider);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _resetState(ref),
      child: DefaultLayout(
        resizeToAvoidBottomInset: false,
        appBar: Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: CustomBackButton(onTap: () => _resetState(ref)),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 48.h),
                      Text('닉네임을 입력해주세요', style: AppTextStyle.heading1),
                      SizedBox(height: 20.h),
                      const SignUpTextFormField(),
                    ],
                  ),
                ),
              ),
            ),
            SubmitButton(
              onTap: () =>
                  Throttle.run(() => AppNavigation.goSignUpStep2(context)),
              width: 343.w,
              text: '확인',
              isActivate: (signUpField.nickname != null),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
