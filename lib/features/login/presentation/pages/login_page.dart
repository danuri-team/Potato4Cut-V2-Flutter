import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/features/login/presentation/widgets/apple_auth_bar.dart';
import 'package:potato_4cut_v2/features/login/presentation/widgets/google_auth_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 255.h),
            SvgPicture.asset('assets/images/potato_4cut_logo.svg'),
            SizedBox(height: 12.h),
            Text('감자네컷', style: AppTextStyle.logoText),
            Spacer(),
            const AppleAuthBar(),
            SizedBox(height: 12.h),
            const GoogleAuthBar(),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
