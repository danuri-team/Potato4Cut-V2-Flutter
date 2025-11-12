import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/frame_list.dart';

class TakePhotoStep1Page extends StatelessWidget {
  const TakePhotoStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const CustomBackButton(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            const CurrentProgressIndicator(),
            SizedBox(height: 14.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('원하는 프레임을 선택해주세요!', style: AppTextStyle.heading1),
            ),
            SizedBox(height: 20.h),
            const FrameList(),
            const Spacer(),
            SubmitButton(
              onTap: () {
                AppNavigation.gotakePhotoStep2(context);
              },
              width: 343.w,
              text: '확인',
              isActivate: true,
            ),
          ],
        ),
      ),
    );
  }
}
