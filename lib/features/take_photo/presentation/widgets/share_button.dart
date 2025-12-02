import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/finished_photo_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends ConsumerWidget {
  const ShareButton({super.key});

  Future<void> sharePhoto(File photo, BuildContext context) async {
    final xfile = XFile(photo.path);
    SharePlus.instance.share(ShareParams(files: [xfile]));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finishedPhoto = ref.watch(finishedPhotoProvider);
    return GestureDetector(
      onTap: finishedPhoto == null
          ? null
          : () => Throttle.run(() => sharePhoto(finishedPhoto, context)),
      child: Container(
        width: 166.w,
        height: 48.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(width: 1, color: AppColor.line2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/frame_share.svg'),
            SizedBox(width: 6.w),
            Text(
              '공유하기',
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.label3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
