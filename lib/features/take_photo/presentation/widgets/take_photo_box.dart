import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/enum/take_photo_flow_type.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/camera_controller_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/countdown_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/current_page_index_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/take_photo_flow_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/photo_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class TakePhotoBox extends ConsumerStatefulWidget {
  const TakePhotoBox({super.key});

  @override
  ConsumerState<TakePhotoBox> createState() => TakePhotoBoxState();
}

class TakePhotoBoxState extends ConsumerState<TakePhotoBox> {
  final pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final pageIndex = pageController.page?.round() ?? 0;
      ref.read(currentPageIndexProvider.notifier).update((state) => pageIndex);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Widget _cameraPreview(CameraController controller, int? countdown) {
    return CameraPreview(
      controller,
      child: countdown != null && countdown > 0
          ? Center(
              child: Text(
                '$countdown',
                style: AppTextStyle.heading1.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColor.static1,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _photoPreview(PhotoItem photoItem, {bool showConfirmedmark = false}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(photoItem.file!),
          fit: BoxFit.cover,
        ),
      ),
      child: showConfirmedmark
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/white_check.svg'),
                SizedBox(height: 10.h),
                Text(
                  '확정',
                  style: AppTextStyle.heading1.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColor.static1,
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _photoBox(
    int index,
    PhotoItem photoItem,
    TakePhotoFlowType takePhotoFlow,
    CameraController cameraController,
  ) {
    final countdown = ref.watch(countdownProvider);
    final currentPageIndex = ref.watch(currentPageIndexProvider);

    switch (takePhotoFlow) {
      case TakePhotoFlowType.TakePhoto:
        return _cameraPreview(cameraController, countdown);

      case TakePhotoFlowType.Confirming:
        final isRetaking = index == currentPageIndex && countdown != null;
        if (isRetaking) {
          return _cameraPreview(cameraController, countdown > 0 ? countdown : null);
        }
        return GestureDetector(
          onTap: () {
            final photoNotifier = ref.read(photoProvider.notifier);
            photoNotifier.toggleConfirmPhoto(index);

            if (photoNotifier.allPhotosConfirmed) {
              ref
                  .read(takePhotoFlowProvider.notifier)
                  .update((state) => TakePhotoFlowType.AfterConfirmation);
            }
          },
          child: _photoPreview(
            photoItem,
            showConfirmedmark: photoItem.isConfirmed,
          ),
        );

      case TakePhotoFlowType.AfterConfirmation:
        return _photoPreview(photoItem, showConfirmedmark: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final photos = ref.watch(photoProvider);
    final takePhotoFlow = ref.watch(takePhotoFlowProvider);
    final cameraController = ref.watch(cameraControllerProvider);
    final countdown = ref.watch(countdownProvider);

    return SizedBox(
      width: double.infinity,
      height: 414.h,
      child: PageView.builder(
        controller: pageController,
        physics: countdown != null
            ? const NeverScrollableScrollPhysics()
            : const PageScrollPhysics(),
        itemCount: takePhotoFlow == TakePhotoFlowType.TakePhoto
            ? 1
            : photos.length,
        itemBuilder: (context, index) {
          if (cameraController == null) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Container(color: AppColor.static2),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: _photoBox(
              index,
              photos[index],
              takePhotoFlow,
              cameraController,
            ),
          );
        },
      ),
    );
  }
}
