import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/presentation/widgets/default_layout.dart';
import 'package:potato_4cut_v2/presentation/views/login/widgets/apple_auth_bar.dart';
import 'package:potato_4cut_v2/presentation/views/login/widgets/google_auth_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            SizedBox(height: 107.h),
            const AppleAuthBar(),
            SizedBox(height: 12.h),
            const GoogleAuthBar(),
          ],
        ),
      ),
    );
  }
}
