import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photo_data_source_impl.dart';
import 'package:potato_4cut_v2/features/take_photo/data/repositories/photo_repository_impl.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/repositories/photo_repository.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/save_4cut_photos_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/usecases/save_photos_use_case.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/view_model/photo_view_model.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/finished_photo.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/share_button.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/finished_photo_provider.dart';

class TakePhotoStep3Page extends ConsumerWidget {
  TakePhotoStep3Page({super.key});

  final repaintBoundaryKey = GlobalKey();

  Future<void> savePhotos(File? photo, WidgetRef ref) async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    final file = File(photo!.path);

    final response = await ref.read(photoViewModel.notifier).savePhotos([file, file, file, file]);

    final cutIds = [];
    for (var element in response.data) {
      cutIds.add(element.cutId);
    }

    await ref.read(photoViewModel.notifier).save4cutPhotos(File(photo.path), List.generate(cutIds.length, (index) => cutIds[index]));


    // final hasAccess = await Gal.hasAccess();
    // if (!hasAccess) {
    //   await Gal.requestAccess();
    // }
    // await Gal.putImage(photo.path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finishedPhoto = ref.watch(finishedPhotoProvider);
    // ref.read(finishedPhotoProvider.notifier).generateFinishedPhoto(repaintBoundaryKey);
    return DefaultLayout(
      appBar: const CustomBackButton(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              try {
                final dio = AppDio.getInstance();
                await dio.post(
                  '/api/v1/auth/refresh',
                  data: {'refreshToken': 'eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJkNWY1ZDA2OC0wOTdmLTQzMDYtOWVjNi1kNzI1OTM5ZmM5NDUiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc2NDIyOTk3NCwiZXhwIjoxNzY0ODM0Nzc0fQ.qW78blkP7V5K4mvX1gKMYe4H7XVcCCbYOykK3Gy69HQJFEUtsro57cga6nQEonMt'},
                );
              } on DioException {
                rethrow;
              } catch (e) {
                throw Exception('Unexpected error during token refresh: $e');
              }
            },
            child: Text('refresh token'),
          ),
          // SizedBox(height: 6.h),
          // const CurrentProgressIndicator(),
          // SizedBox(height: 24.h),
          // Text('완성된 사진,\n친구들에게 바로 공유해보세요!', style: AppTextStyle.heading1),
          // SizedBox(height: 16.h),
          // FinishedPhoto(repaintBoundaryKey: repaintBoundaryKey),
          // const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShareButton(),
              SizedBox(width: 12.w),
              SubmitButton(
                onTap: () => savePhotos(finishedPhoto, ref),
                // onTap: finishedPhoto == null
                //     ? () {}
                //     : () => Throttle.run(() => savePhotos(finishedPhoto)),
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
