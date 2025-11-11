import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';

class TakePhotoAppbar extends StatelessWidget {
  const TakePhotoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: GestureDetector(
        onTap:() => AppNavigation.pop(context),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/chevron_left.svg'),
            SizedBox(width: 10.w),
            Text(
              '네컷 찍기',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
