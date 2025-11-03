import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TakePhotoCard extends StatefulWidget {
  const TakePhotoCard({super.key});

  @override
  State<TakePhotoCard> createState() => _TakePhotoBoxState();
}

class _TakePhotoBoxState extends State<TakePhotoCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => isTapped = !isTapped),
      onTapUp: (details) => setState(() => isTapped = !isTapped),
      onTapCancel:() => setState(() => isTapped = false),
      child: Container(
        width: 343.w,
        height: 174.h,
        decoration: ShapeDecoration(
          color: isTapped ? Color(0xFFFBEACC) : Color(0xCDF2F2F2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                        '네컷 찍기',
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
                    '본인 혹은 스토어의\n프레임으로 네컷을 찍어요',
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
                          'assets/images/tapped_take_photo_image.svg',
                        )
                      : SvgPicture.asset('assets/images/take_photo_image.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
