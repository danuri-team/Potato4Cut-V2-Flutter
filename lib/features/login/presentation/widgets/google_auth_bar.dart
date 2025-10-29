import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class GoogleAuthBar extends StatelessWidget {
  const GoogleAuthBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 345.w,
        height: 48.h,
        decoration: ShapeDecoration(
          color: AppColor.background1,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.line2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/google_auth_logo.svg'),
            SizedBox(width: 6.w),
            Text(
              'Google로 계속하기',
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
