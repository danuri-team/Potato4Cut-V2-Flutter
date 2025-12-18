import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class Potato4cutFrame extends StatelessWidget {
  const Potato4cutFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 286.w,
      height: 472.h,
      decoration: BoxDecoration(
        color: AppColor.background1,
        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 12,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Column(
          children: [
            SizedBox(
              width: 250.w,
              height: 376.h,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 121.w / 184.h,
                ),
                itemBuilder: (context, index) {
                  return Container(color: AppColor.static2);
                },
              ),
            ),
            const Spacer(),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/potato_4cut_logo.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 6.w),
                Text(
                  '감자네컷',
                  style: AppTextStyle.ownglyph.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
