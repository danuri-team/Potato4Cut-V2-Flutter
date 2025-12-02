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
import 'package:potato_4cut_v2/features/take_photo/presentation/view_model/photo_view_model.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/finished_photo.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/share_button.dart';
import 'package:potato_4cut_v2/core/enum/take_photo_flow_type.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/cut_ids_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/current_page_index_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/finished_photo_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/photo_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/take_photo_flow_provider.dart';

class TakePhotoStep3Page extends ConsumerWidget {
  TakePhotoStep3Page({super.key});

  final repaintBoundaryKey = GlobalKey();

  Future<void> save4CutPhotos(
    File photo,
    WidgetRef ref,
    BuildContext context,
  ) async {
    final cutIds = ref.watch(cutIdsProvider);

    await ref
        .read(photoViewModel.notifier)
        .save4cutPhotos(File(photo.path), cutIds);

    final hasAccess = await Gal.hasAccess();
    if (!hasAccess) {
      await Gal.requestAccess();
    }
    await Gal.putImage(photo.path);

    ref.read(photoProvider.notifier).reset();
    ref.read(currentPageIndexProvider.notifier).update((state) => 0,);
    ref.read(cutIdsProvider.notifier).update((state) => [],);
    ref.read(finishedPhotoProvider.notifier).resetState();
    ref.read(takePhotoFlowProvider.notifier).update((state) => TakePhotoFlowType.TakePhoto,);

    AppNavigation.goHome(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finishedPhoto = ref.watch(finishedPhotoProvider);
    return DefaultLayout(
      appBar: const CustomBackButton(),
      body: Column(
        children: [
          SizedBox(height: 6.h),
          const CurrentProgressIndicator(),
          SizedBox(height: 24.h),
          Text('완성된 사진,\n친구들에게 바로 공유해보세요!', style: AppTextStyle.heading1),
          SizedBox(height: 16.h),
          FinishedPhoto(repaintBoundaryKey: repaintBoundaryKey),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShareButton(),
              SizedBox(width: 12.w),
              SubmitButton(
                onTap: finishedPhoto == null
                    ? () {}
                    : () => Throttle.run(
                        () => save4CutPhotos(finishedPhoto, ref, context),
                      ),
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
