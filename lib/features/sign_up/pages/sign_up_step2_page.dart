import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/provider/potato_facial_expression_provider.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/sign_up/widgets/select_potato_grid_view.dart';

class SignUpStep2Page extends ConsumerWidget {
  const SignUpStep2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final potato = ref.watch(potatoAssetProvider);
    return DefaultLayout(
      appBar: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: SvgPicture.asset('assets/images/chevron_left.svg'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.h),
            Text('원하는 감자를 선택해주세요!', style: AppTextStyle.heading1),
            SizedBox(height: 20.h),
            const SelectPotatoGridView(),
            const Spacer(),
            SubmitButton(
              onTap: () =>
                  Throttle.run(() => AppNavigation.goSignUpStep3(context)),
              width: 343.w,
              text: '확인',
              isActivate: potato != null,
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
