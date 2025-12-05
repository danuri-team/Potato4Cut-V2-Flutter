import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/login/provider/users_view_model.dart';
import 'package:potato_4cut_v2/features/sign_up/presentation/widgets/profile_presets.dart';
import 'package:potato_4cut_v2/features/sign_up/provider/sign_up_field_provider.dart';

class SignUpStep2Page extends ConsumerWidget {
  const SignUpStep2Page({super.key});

  submit(WidgetRef ref, BuildContext context) {
    final signUpField = ref.read(signUpFieldProvider);
    Throttle.run(() async{
      await ref
          .read(usersProvider.notifier)
          .profileUpdate(
            nickname: signUpField.nickname!,
            profilePresetId: signUpField.profilePresetId!,
          );
      AppNavigation.goSignUpStep3(context);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpField = ref.watch(signUpFieldProvider);
    return DefaultLayout(
      appBar: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: const CustomBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.h),
            Text('원하는 감자를 선택해주세요!', style: AppTextStyle.heading1),
            SizedBox(height: 20.h),
            const ProfilePresets(),
            const Spacer(),
            SubmitButton(
              onTap: () => submit(ref, context),
              width: 343.w,
              text: '확인',
              isActivate: signUpField.profilePresetId != null,
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
