import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';

class WithdrawAndLogout extends StatelessWidget {
  const WithdrawAndLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125.w,
      height: 14.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              '회원 탈퇴',
              style: TextStyle(
                color: AppColor.label3,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
          VerticalDivider(
            color: AppColor.label2,
            width: 12.w,
            thickness: 1.h,
            indent: 3.h,
            endIndent: 3.h,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              '로그아웃',
              style: TextStyle(
                color: AppColor.label3,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
//     width: 1,
//     height: double.maxFinite,
//     color: Colors.grey,
// )
