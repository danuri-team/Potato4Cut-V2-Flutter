import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/features/login/presentation/widgets/apple_auth_bar.dart';
import 'package:potato_4cut_v2/features/login/presentation/widgets/google_auth_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = AppDio.getInstance();
    final token =
        'eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiI1ZTI4ZDI2OC1kM2E5LTRhMTEtYTUzYS1mMzY1ZGY5NzdiOGEiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc2NDIwMTM1MywiZXhwIjoxNzY0MjA0OTUzfQ.5zUWzCyIrdzPzFnMpYIqOF0Y337Ilepb_vVgrweG2s7S5mws1XtesVC-9IHNklHn';
    return DefaultLayout(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 255.h),
            SvgPicture.asset('assets/images/potato_4cut_logo.svg'),
            SizedBox(height: 12.h),
            Text('감자네컷', style: AppTextStyle.logoText),
            ElevatedButton(
              onPressed: () async {
                // dio.get(
                //   '/api/v1/users/me',
                //   options: Options(headers: {"Authorization": "Bearer $token"}),
                // );

                final photo = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                final file = File(photo!.path);
                final images = [file, file];
                final List<MultipartFile> uploadFiles = [];

                for (File image in images) {
                  uploadFiles.add(
                    await MultipartFile.fromFile(
                      image.path,
                      filename: image.uri.pathSegments.last,
                      contentType: MediaType("image", "jpeg"),
                    ),
                  );
                }

                final FormData formData2 = FormData.fromMap({
                  "images": uploadFiles,
                });
                await dio.post(
                  '/api/v1/photos/cuts',
                  data: formData2,

                  options: Options(headers: {"Authorization": "Bearer $token"}),
                );
              },
              child: Text('api'),
            ),
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
