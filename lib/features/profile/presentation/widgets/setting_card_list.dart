import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingCardList extends StatefulWidget {
  const SettingCardList({super.key});

  @override
  State<SettingCardList> createState() => _SettingCardListState();
}

class _SettingCardListState extends State<SettingCardList> {
  Future<void> getPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  String? version;

  @override
  void initState() {
    super.initState();
    getPackageInfo();
  }

  Widget card({required String text, Function()? onTap, Widget? suffixWidget}) {
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
        card(text: '언어 설정', onTap: () {}),
        SizedBox(height: 16.h),
        card(
          text: '개인정보 처리방침',
          onTap: () {
            launchUrl(
              Uri.parse(
                'https://working-mailman-871.notion.site/28d5f20bda6f8023918cd8624f1c083d',
              ),
            );
          },
        ),
        SizedBox(height: 16.h),
        card(text: '이용 약관', onTap: () {}),
        SizedBox(height: 16.h),
        card(
          text: '버전 정보',
          suffixWidget: Text(
            version ?? '',
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
