import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/share_button.dart';

class TakePhotoStep3Page extends ConsumerWidget {
  const TakePhotoStep3Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appBar: const CustomBackButton(),
      body: Column(
        children: [
          SizedBox(height: 6.h),
          const CurrentProgressIndicator(),
          SizedBox(height: 50.h),
          Text('완성된 사진,\n친구들에게 바로 공유해보세요!', style: AppTextStyle.heading1),
          SizedBox(height: 37.h),
          SizedBox(
            width: double.infinity,
            height: 480.h,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset('assets/images/finished_potato1.svg'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/images/finished_potato2.svg'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShareButton(),
              SizedBox(width: 12.w),
              SubmitButton(
                onTap: () {},
                width: 166.w,
                text: '저장하기',
                isActivate: true,
                prefixSvg: SvgPicture.asset(
                  'assets/images/upload.svg',
                  color: AppColor.static1,
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ],
      ),
    );
  }
}
