import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class SelectFrame extends StatelessWidget {
  const SelectFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '프레임 선택하기',
            style: AppTextStyle.label1Normal.copyWith(
              color: AppColor.label2,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset('assets/images/refresh.svg'),
        ],
      ),
    );
  }
}
