import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gal/gal.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/request/save_4cut_photos_request_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/view_model/photo_view_model.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/finished_photo.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/share_button.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/finished_photo_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/object_key_provider.dart';

class FinishedPhotoPage extends ConsumerWidget {
  FinishedPhotoPage({super.key});

  final repaintBoundaryKey = GlobalKey();

  Future<void> save4CutPhotos(File photo, WidgetRef ref) async {
    final hasAccess = await Gal.hasAccess();
    if (!hasAccess) {
      await Gal.requestAccess();
    }

    final objectKey = ref.watch(objectKeyProvider);

    if (objectKey == null) return;

    Throttle.run(() async {
      await ref
          .read(photoViewModel.notifier)
          .save4cutPhotos(Save4cutPhotosRequestEntity('frameId', objectKey));

      await Gal.putImage(photo.path);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finishedPhoto = ref.watch(finishedPhotoProvider);
    return DefaultLayout(
      appBar: CustomBackButton(),
      body: Column(
        children: [
          SizedBox(height: 6.h),
          SizedBox(height: 24.h),
          Text('잘 나온 사진을 바로 공유해요', style: AppTextStyle.heading1),
          SizedBox(height: 16.h),
          FinishedPhoto(repaintBoundaryKey: repaintBoundaryKey),
          SizedBox(height: 25.h),
          GestureDetector(
            onTap: () => Throttle.run(() => AppNavigation.goHome(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '메인페이지로 가기',
                  style: AppTextStyle.label1Normal.copyWith(
                    color: AppColor.label2,
                  ),
                ),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  'assets/images/chevron_right_gray.svg',
                  width: 16.w,
                  height: 16.h,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShareButton(),
              SizedBox(width: 12.w),
              SubmitButton(
                onTap: () => save4CutPhotos(finishedPhoto!, ref),
                width: 166.w,
                text: '저장하기',
                isActivate: true,
                prefixSvg: SvgPicture.asset(
                  'assets/images/upload.svg',
                  color: AppColor.static1,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
