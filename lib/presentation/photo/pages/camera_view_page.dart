import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/enum/photo_flow_type.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/camera_controller_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/countdown_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/current_page_index_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_flow_provider.dart';
import 'package:image/image.dart' as img;

Future<String> _flipImageHorizontallyIsolate(String imagePath) async {
  final imageFile = File(imagePath);
  final bytes = await imageFile.readAsBytes();
  final image = img.decodeImage(bytes);

  if (image == null) {
    return imagePath;
  }
  final flippedImage = img.flipHorizontal(image);
  await imageFile.writeAsBytes(img.encodeJpg(flippedImage));

  return imagePath;
}

class CameraViewPage extends ConsumerStatefulWidget {
  const CameraViewPage({super.key});

  @override
  ConsumerState<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends ConsumerState<CameraViewPage> {
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    final cameraController = ref.read(cameraControllerProvider);
    if (cameraController == null) {
      ref.read(cameraControllerProvider.notifier).initCamera();
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  Future<void> _takePhoto(int photoIndex) async {
    final completer = Completer<void>();
    final photoFlow = ref.read(photoFlowProvider);
    final countdownStart = photoFlow == PhotoFlowType.TakePhoto ? 4 : 3;
    ref.read(countdownProvider.notifier).startCountdown(countdownStart);
    final cameraController = ref.read(cameraControllerProvider);

    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (!mounted) {
        timer.cancel();
        _countdownTimer = null;
        return;
      }

      final countdown = ref.read(countdownProvider);

      if (countdown != null && countdown > 0) {
        ref.read(countdownProvider.notifier).decrementCountdown();
      } else {
        timer.cancel();
        _countdownTimer = null;

        final xFile = await ref
            .read(cameraControllerProvider.notifier)
            .takePicture();

        if (cameraController?.description.lensDirection ==
            CameraLensDirection.front) {
          if (photoFlow == PhotoFlowType.TakePhoto) {
            ref
                .read(photoProvider.notifier)
                .takePhoto(photoIndex, File(xFile.path));

            ref.read(countdownProvider.notifier).resetCountdown();

            if (photoIndex < 3) {
              completer.complete();
            }

            compute(_flipImageHorizontallyIsolate, xFile.path).then((
              flippedImagePath,
            ) {
              ref
                  .read(photoProvider.notifier)
                  .takePhoto(photoIndex, File(flippedImagePath));
              if (photoIndex == 3) {
                completer.complete();
              }
            });
          } else if (photoFlow == PhotoFlowType.Updating) {
            final imgaePath = await _flipImageHorizontallyIsolate(xFile.path);
            ref
                .read(photoProvider.notifier)
                .takePhoto(photoIndex, File(imgaePath));
            ref.read(countdownProvider.notifier).resetCountdown();
            completer.complete();
          }
        } else if (cameraController?.description.lensDirection ==
            CameraLensDirection.back) {
          ref
              .read(photoProvider.notifier)
              .takePhoto(photoIndex, File(xFile.path));
          ref.read(countdownProvider.notifier).resetCountdown();
          completer.complete();
        }
      }
    });

    await completer.future;
  }

  Future<void> _takeFourContinuousPhotos() async {
    for (int i = 0; i < 4; i++) {
      await _takePhoto(i);
    }

    ref
        .read(photoFlowProvider.notifier)
        .update((state) => PhotoFlowType.Updating);
  }

  String _photoLabel(int photoCount) {
    switch (photoCount) {
      case 0:
        return '첫번째\n사진';
      case 1:
        return '두번째\n사진';
      case 2:
        return '세번째\n사진';
      case 3:
        return '네번째\n사진';
      default:
        return '';
    }
  }

  Widget _cameraPreview() {
    final countdown = ref.watch(countdownProvider);
    final cameraController = ref.watch(cameraControllerProvider);
    final photoFlow = ref.watch(photoFlowProvider);
    final photoCount = ref.watch(photoProvider.notifier).photoCount;

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.width;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: (cameraController == null)
          ? Container(color: AppColor.static2)
          : Transform.scale(
              scale: cameraController.value.aspectRatio / deviceRatio,
              child: AspectRatio(
                // aspectRatio: 16 / 9,
                aspectRatio: cameraController.value.aspectRatio,
                child: CameraPreview(
                  cameraController,
                  child: countdown != null && countdown > 0
                      ? Center(
                          child: Text(
                            photoFlow == PhotoFlowType.TakePhoto &&
                                    countdown == 4
                                ? _photoLabel(photoCount)
                                : '$countdown',
                            style: AppTextStyle.ownglyph.copyWith(
                              color: AppColor.static1,
                              fontSize: 80.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
    );
  }

  Widget _buttons() {
    final photos = ref.watch(photoProvider);
    return SizedBox(
      width: 343.w,
      height: 96.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(width: 1, color: AppColor.interaction1),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 16.w,
                height: 20.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: photos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 2.h,
                    childAspectRatio: 7.w / 9.h,
                  ),
                  itemBuilder: (context, index) {
                    final photoCount = ref
                        .read(photoProvider.notifier)
                        .photoCount;
                    return Container(
                      decoration: BoxDecoration(
                        color: index < photoCount
                            ? AppColor.m300
                            : AppColor.background1,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(width: 60.w),
          GestureDetector(
            onTap: () async {
              final countDown = ref.read(countdownProvider);
              final photoFlow = ref.read(photoFlowProvider);
              Throttle.run(() async {
                if (countDown == null) {
                  if (photoFlow == PhotoFlowType.TakePhoto) {
                    await _takeFourContinuousPhotos();
                  } else if (photoFlow == PhotoFlowType.Updating) {
                    final currentPageIndex = ref.read(currentPageIndexProvider);
                    await _takePhoto(currentPageIndex);
                  }
                }
                AppNavigation.goPhotoView(context);
              });
            },
            child: Container(
              width: 96.w,
              height: 56.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFE8A025),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/camera.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
          SizedBox(width: 60.w),
          GestureDetector(
            onTap: () => Throttle.run(
              () => ref.read(cameraControllerProvider.notifier).switchCamera(),
            ),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: ShapeDecoration(
                shape: OvalBorder(),
                color: AppColor.interaction1,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/refresh.svg'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      top: false,
      body: Stack(
        children: [
          _cameraPreview(),
          Column(
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  margin: EdgeInsets.only(top: 14.h),
                  height: 46.h,
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Throttle.run(() {
                        ref.read(countdownProvider.notifier).resetCountdown();
                        AppNavigation.pop(context);
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/chevron_left.svg',
                      color: AppColor.static1,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              _buttons(),
              SizedBox(height: 20.h),
            ],
          ),
        ],
      ),
    );
  }
}
