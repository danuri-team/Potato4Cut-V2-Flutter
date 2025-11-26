import 'dart:developer';
import 'dart:io';
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
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photos_data_source.dart';
import 'package:potato_4cut_v2/features/take_photo/data/data_sources/photos_data_source_impl.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/finished_photo.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/share_button.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/finished_photo_provider.dart';

class TakePhotoStep3Page extends ConsumerWidget {
  TakePhotoStep3Page({super.key});

  final repaintBoundaryKey = GlobalKey();

  Future<void> savePhoto(File photo) async {
    final hasAccess = await Gal.hasAccess();
    if (!hasAccess) {
      await Gal.requestAccess();
    }
    await Gal.putImage(photo.path);
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
              // final photo = await ImagePicker().pickImage(
              //   source: ImageSource.gallery,
              // );
              // final file = File(photo!.path);
              final dio = AppDio.getInstance();
              // PhotosDataSourceImpl(dio).savePhoto(file);
              PhotosDataSourceImpl(dio).getMyInfo();
            },
            child: Text('api'),
          ),
          // SizedBox(height: 6.h),
          // const CurrentProgressIndicator(),
          // SizedBox(height: 24.h),
          // Text('완성된 사진,\n친구들에게 바로 공유해보세요!', style: AppTextStyle.heading1),
          // SizedBox(height: 16.h),
          // FinishedPhoto(repaintBoundaryKey: repaintBoundaryKey),
          // const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const ShareButton(),
          //     SizedBox(width: 12.w),
          //     SubmitButton(
          //       onTap: finishedPhoto == null
          //           ? (){}
          //           : () => Throttle.run(() => savePhoto(finishedPhoto),),
          //       width: 166.w,
          //       text: '저장하기',
          //       isActivate: true,
          //       prefixSvg: SvgPicture.asset(
          //         'assets/images/upload.svg',
          //         color: AppColor.static1,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
