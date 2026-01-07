import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gal/gal.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/frame_base_image_url_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/save_photo_field_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/widgets/finished_photo.dart';
import 'package:potato_4cut_v2/presentation/photo/widgets/share_button.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/finished_photo_provider.dart';

class FinishedPhotoPage extends ConsumerWidget {
  FinishedPhotoPage({super.key});

  final repaintBoundaryKey = GlobalKey();

  Future<void> save4CutPhotos(
    BuildContext context,
    GlobalKey repaintBoundaryKey,
    WidgetRef ref,
  ) async {
    try {
      final hasAccess = await Gal.hasAccess();
      if (!hasAccess) {
        await Gal.requestAccess();
      }

      final pngBytes = await ref
          .read(finishedPhotoProvider.notifier)
          .captureImage(repaintBoundaryKey, pixelRatio: 4.0);

      final dir = await getApplicationDocumentsDirectory();
      final formatDate = DateFormat("yyyy.MM.dd.HH.mm").format(DateTime.now());
      final file = File('${dir.path}/$formatDate.png');
      final savedFile = await file.writeAsBytes(pngBytes);

      Throttle.run(() async {
        await Gal.putImage(savedFile.path);

        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('사진이 저장되었습니다.')));
        }
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('저장 중 오류가 발생했습니다.')));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onTap: () => Throttle.run(() {
              AppNavigation.goHome(context);
              ref.read(savePhotoFieldProvider.notifier).resetField();
              ref
                  .read(frameBaseImageUrlProvider.notifier)
                  .update((state) => null);
              ref
                  .read(frameOverlayImageUrlProvider.notifier)
                  .update((state) => null);
            }),
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
              ShareButton(repaintBoundaryKey: repaintBoundaryKey),
              SizedBox(width: 12.w),
              SubmitButton(
                onTap: () {
                  save4CutPhotos(context, repaintBoundaryKey, ref);
                },
                width: 166.w,
                text: '저장하기',
                isActivate: true,
                prefixSvg: SvgPicture.asset(
                  'assets/images/upload.svg',
                  colorFilter: ColorFilter.mode(
                    AppColor.static1,
                    BlendMode.srcIn,
                  ),
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
