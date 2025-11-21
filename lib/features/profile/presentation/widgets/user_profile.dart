import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60.r,
          height: 60.r,
          decoration: ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(width: 1, color: AppColor.line1),
            ),
          ),
        ),
        SizedBox(width: 13.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '닉네임',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/google_auth_logo.svg',
                  width: 10.w,
                  height: 10.h,
                ),
                SizedBox(width: 4.w),
                Text('example@gmail.com'),
              ],
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset('assets/images/chevron_right.svg'),
      ],
    );
  }
}
