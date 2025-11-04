import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class SettingCardList extends StatelessWidget {
  const SettingCardList({super.key});

  Widget settingCard({
    required String text,
    required Function() onTap,
    Widget? suffixWidget,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 48.h,
        child: Row(
          children: [
            Text(
              text,
              style: AppTextStyle.body1Normal.copyWith(
                color: AppColor.label4,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            suffixWidget ?? SvgPicture.asset('assets/images/chevron_right.svg'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        settingCard(text: '언어 설정', onTap: () {}),
        SizedBox(height: 16.h),
        settingCard(text: '알림 설정', onTap: () {}),
        SizedBox(height: 16.h),
        settingCard(text: '구매내역/제작내역', onTap: () {}),
        SizedBox(height: 16.h),
        settingCard(text: '문의하기/신고하기', onTap: () {}),
        SizedBox(height: 16.h),
        settingCard(text: '개인정보 처리방침', onTap: () {}),
        SizedBox(height: 16.h),
        settingCard(text: '이용 약관', onTap: () {}),
        SizedBox(height: 16.h),
        settingCard(
          text: '버전 정보',
          onTap: () {},
          suffixWidget: Text(
            'v0.1',
            style: AppTextStyle.body1Normal.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColor.label4,
            ),
          ),
        ),
      ],
    );
  }
}
