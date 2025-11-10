import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class GoogleAuthBar extends StatelessWidget {
  GoogleAuthBar({super.key});

  final GoogleSignIn googleSignInInstance = GoogleSignIn.instance;

  Future<void> signInGoogle() async {
    await googleSignInInstance.initialize(
      // clientId:
      //     '548875410267-ko7a605h8019i05rboo363cnqs08iibs.apps.googleusercontent.com',
      // clientId: '548875410267-vgj4u431ar9ivj21akdm30qj2qfi12i0.apps.googleusercontent.com',
      // serverClientId: '548875410267-ko7a605h8019i05rboo363cnqs08iibs.apps.googleusercontent.com',
    );
    // googleSignInInstance.authenticationEvents.first.then(
    //   (value) => log('value = $value'),
    // );
    // googleSignInInstance.authenticate();
    // googleSignInInstance.authorizationClient;
    // googleSignInInstance.attemptLightweightAuthentication()?.then(
    //   (value) => log('value = $value'),
    // );

    try {
      final account = await googleSignInInstance.authenticate();
      final a = GoogleSignInAuthentication(
        idToken: account.authentication.idToken,
      );
      final b = GoogleSignInAuthenticationEventSignIn(user: account);
      log('${account.authentication.idToken}');

      // final dio = AppDio.getInstance();
      // await dio.post(
      //   '${dotenv.env['apiBaseUrl']}/api/v1/auth/login',
      //   data: jsonEncode({
      //     "provider": "GOOGLE",
      //     "oauthToken": account.authentication.idToken,
      //     "deviceToken": "",
      //   }),
      // );
    } on GoogleSignInException catch (error) {
      log(
        'Google Error : ${error.code}, ${error.description}, ${error.details}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signInGoogle();
      },
      child: Container(
        width: 345.w,
        height: 48.h,
        decoration: ShapeDecoration(
          color: AppColor.background1,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.line2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/google_auth_logo.svg'),
            SizedBox(width: 6.w),
            Text(
              'Google로 계속하기',
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
