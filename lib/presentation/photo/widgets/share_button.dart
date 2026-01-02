import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends ConsumerWidget {
  final GlobalKey repaintBoundaryKey;

  const ShareButton({super.key, required this.repaintBoundaryKey});

  Future<void> sharePhoto(GlobalKey key, BuildContext context) async {
    try {
      final formatDate = DateFormat("yyyy.MM.dd.HH.mm").format(DateTime.now());

      final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 4.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/share_$formatDate.png');
      final savedFile = await file.writeAsBytes(pngBytes);

      final xfile = XFile(savedFile.path);
      await SharePlus.instance.share(ShareParams(files: [xfile]));
    } catch (e) {
      // Error sharing photo
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => Throttle.run(() => sharePhoto(repaintBoundaryKey, context)),
          // : () => Throttle.run(
          //     () => showModalBottomSheet(
          //       context: context,
          //       builder: (context) => ShareBottomSheet(),
          //     ),
          //   ),
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
