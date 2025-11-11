import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class FrameList extends StatelessWidget {
  const FrameList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 343.w,
          height: 428.h,
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3.5,
              mainAxisSpacing: 10,
              childAspectRatio: 112 / 140,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: AppColor.line2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Center(child: Text('Frame ${index + 1}')),
              );
            },
          ),
        ),
        SizedBox(height: 14.h),
        GestureDetector(
          onTap: () {},

          child: Container(
            padding: EdgeInsets.only(left: 8.w),
            width: 59.w,
            height: 24.h,
            decoration: ShapeDecoration(
              color: AppColor.fill1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              children: [
                Text(
                  '더보기',
                  style: AppTextStyle.caption1.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColor.label6,
                  ),
                ),
                SizedBox(width: 2.w),
                SvgPicture.asset('assets/images/chevron_drop_down.svg'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
