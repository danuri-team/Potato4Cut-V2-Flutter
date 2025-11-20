import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/enum/take_photo_flow_type.dart';
import 'package:potato_4cut_v2/core/provider/current_page_index_provider.dart';
import 'package:potato_4cut_v2/core/provider/photo_provider.dart';
import 'package:potato_4cut_v2/core/provider/take_photo_flow_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class ImportExistingPhotos extends ConsumerWidget {
  const ImportExistingPhotos({super.key});

  importExistingPhotos(WidgetRef ref) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    ref.read(photoProvider.notifier).importExistingPhotos(currentPageIndex);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(photoProvider);
    final takePhotoFlow = ref.watch(takePhotoFlowProvider);
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GestureDetector(
        onTap:
            takePhotoFlow != TakePhotoFlowType.TakePhoto &&
                !photos[currentPageIndex].isConfirmed
            ? () async {
                await importExistingPhotos(ref);
              }
            : () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/upload.svg',
              color:
                  takePhotoFlow == TakePhotoFlowType.TakePhoto ||
                      photos[currentPageIndex].isConfirmed
                  ? Color(0xFFC4C4C4)
                  : null,
            ),
            SizedBox(width: 10.w),
            Text(
              '기존 사진 가져오기',
              style: AppTextStyle.headLine1.copyWith(
                color:
                    takePhotoFlow == TakePhotoFlowType.TakePhoto ||
                        photos[currentPageIndex].isConfirmed
                    ? Color(0xFFC4C4C4)
                    : const Color(0xFF474747),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
