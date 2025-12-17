import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/ui/in_development.dart';

class MakeFrameCard extends StatelessWidget {
  const MakeFrameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const InDevelopment(),
      ),
      child: Container(
        width: 343.w,
        height: 174.h,
        decoration: ShapeDecoration(
          color: Color(0xFFFAECD3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 27.h, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '프레임 만들기',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      SvgPicture.asset('assets/images/chevron_right.svg'),
                    ],
                  ),
                  SizedBox(height: 44.h),
                  Text(
                    '그림을 그려서 나만의\n프레임을 만들 수 있어요',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.30,
                      letterSpacing: 0.14,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10.56.w),
                child: SvgPicture.asset('assets/images/make_frame_potato.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
