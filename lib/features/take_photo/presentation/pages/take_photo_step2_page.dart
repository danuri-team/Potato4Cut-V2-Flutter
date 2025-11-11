import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/providers/photo_list_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_page_index_bar.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/take_photo_appbar.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/take_photo_box.dart';

class TakePhotoStep2Page extends ConsumerWidget {
  const TakePhotoStep2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<TakePhotoBoxState> takePhotoBoxKey =
        GlobalKey<TakePhotoBoxState>();
    final photos = ref.watch(photoListProvider);
    return DefaultLayout(
      appBar: const TakePhotoAppbar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            const CurrentPageIndexBar(),
            SizedBox(height: 35.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('4컷 완성! 공유해요', style: AppTextStyle.heading1),
            ),
            SizedBox(height: 23.h),
            TakePhotoBox(key: takePhotoBoxKey),
            SizedBox(height: 12.h),
            Text(
              '${photos.length}/4',
              style: AppTextStyle.heading1.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.label1,
              ),
            ),
            const Spacer(),
            SubmitButton(
              onTap: () async {
                if (takePhotoBoxKey.currentState?.cameraController != null) {
                  final photo = await takePhotoBoxKey
                      .currentState!
                      .cameraController!
                      .takePicture();
                  final file = File(photo.path);
                  ref.read(photoListProvider.notifier).takePhoto(file);
                }
                if (photos.length == 4) {
                  AppNavigation.gotakePhotoStep3(context);
                }
              },
              width: 343.w,
              svg: SvgPicture.asset('assets/images/camera.svg'),
              text: '사진찍기',
              isActivate: true,
            ),
          ],
        ),
      ),
    );
  }
}
