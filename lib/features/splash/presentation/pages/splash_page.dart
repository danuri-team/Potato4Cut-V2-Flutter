import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_scaffold.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/potato_4cut_logo.svg'),
            SizedBox(height: 12.h),
            Text('감자네컷', style: AppTextStyle.logoText),
          ],
        ),
      ),
    );
  }
}
