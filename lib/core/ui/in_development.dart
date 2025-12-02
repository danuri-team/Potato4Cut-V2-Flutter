import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class InDevelopment extends StatelessWidget {
  const InDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/in_development_potato.svg'),
              SizedBox(height: 20.h),
              Text('지금 열심히 개발하고 있어요!', style: AppTextStyle.heading2),
              SizedBox(height: 6.h),
              Text(
                '기대해 주세요, 곧 만나보실 수 있어요',
                style: AppTextStyle.headLine2.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.label3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
