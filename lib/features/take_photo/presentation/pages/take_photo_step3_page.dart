import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';

class TakePhotoStep3Page extends StatelessWidget {
  const TakePhotoStep3Page({super.key});

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 166.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(width: 1, color: AppColor.line2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/frame_share.svg'),
                      SizedBox(width: 6.w),
                      Text(
                        '공유하기',
                        style: AppTextStyle.body1Normal.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.label3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
