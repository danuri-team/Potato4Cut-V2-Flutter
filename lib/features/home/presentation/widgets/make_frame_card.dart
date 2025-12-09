import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/ui/in_development.dart';

class MakeFrameCard extends StatefulWidget {
  const MakeFrameCard({super.key});

  @override
  State<MakeFrameCard> createState() => _MakeFrameBoxState();
}

class _MakeFrameBoxState extends State<MakeFrameCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => isTapped = !isTapped),
      onTapUp: (details) => setState(() => isTapped = !isTapped),
      onTapCancel: () => setState(() => isTapped = false),
      onTap: () => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const InDevelopment(),
      ),
      child: Container(
        width: 343.w,
        height: 174.h,
        decoration: ShapeDecoration(
          color: isTapped ? Color(0xFFFBEACC) : Color(0xCDF2F2F2),
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
            Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 173.4.w),
                  child: isTapped
                      ? SvgPicture.asset(
                          'assets/images/tapped_make_frame_image.svg',
                        )
                      : SvgPicture.asset('assets/images/make_frame_image.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
