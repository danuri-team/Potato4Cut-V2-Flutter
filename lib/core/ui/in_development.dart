import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class InDevelopment extends StatelessWidget {
  const InDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      backgroundColor: AppColor.background1,
      title: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => AppNavigation.pop(context),
          child: SvgPicture.asset('assets/images/x.svg'),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset('assets/images/in_development_potato.svg'),
            SizedBox(height: 20.h),
            Text('조금만 기다려주세요', style: AppTextStyle.heading2),
            SizedBox(height: 6.h),
            Text(
              '열심히 준비하고 있어요. 곧 보여드릴게요',
              style: AppTextStyle.headLine2.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColor.label3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
