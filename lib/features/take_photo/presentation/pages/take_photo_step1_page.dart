import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/potato4cut_frame.dart';

class TakePhotoStep1Page extends ConsumerWidget {
  const TakePhotoStep1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appBar: CustomBackButton(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            const CurrentProgressIndicator(),
            SizedBox(height: 14.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('원하는 프레임을 찾아보세요', style: AppTextStyle.heading1),
            ),
            SizedBox(height: 46.h),
            const Potato4cutFrame(),
            const Spacer(),
            SubmitButton(
              onTap: () {
                Throttle.run(() {
                  AppNavigation.gotakePhotoStep2(context);
                });
              },
              width: 343.w,
              text: '다음으로',
              isActivate: true,
            ),
          ],
        ),
      ),
    );
  }
}
