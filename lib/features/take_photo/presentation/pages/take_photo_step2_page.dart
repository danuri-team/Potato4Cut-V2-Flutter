import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/enum/take_photo_flow_type.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/view_model/photo_view_model.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/camera_controller_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/countdown_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/current_page_index_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/cut_ids_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/take_photo_flow_provider.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/photo_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/current_progress_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/import_existing_photos.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/outlined_submit_button.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/photo_step_indicator.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/widgets/take_photo_box.dart';

class TakePhotoStep2Page extends ConsumerStatefulWidget {
  const TakePhotoStep2Page({super.key});

  @override
  ConsumerState<TakePhotoStep2Page> createState() => _TakePhotoStep2PageState();
}

class _TakePhotoStep2PageState extends ConsumerState<TakePhotoStep2Page> {
  bool _isLoading = false;

  void _resetPhotoFlow(WidgetRef ref) {
    ref
        .read(takePhotoFlowProvider.notifier)
        .update((state) => TakePhotoFlowType.TakePhoto);
  }

  Future<void> _takePhoto(WidgetRef ref, int photoIndex) async {
    final completer = Completer<void>();
    ref.read(countdownProvider.notifier).startCountdown();

    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final countdown = ref.read(countdownProvider);

      if (countdown != null && countdown > 0) {
        ref.read(countdownProvider.notifier).decrementCountdown();
      } else {
        timer.cancel();

        final xFile = await ref
            .read(cameraControllerProvider.notifier)
            .takePicture();

        ref
            .read(photoProvider.notifier)
            .takePhoto(photoIndex, File(xFile.path));

        ref.read(countdownProvider.notifier).resetCountdown();
        completer.complete();
      }
    });

    await completer.future;
  }

  Future<void> takeFourContinuousPhotos(WidgetRef ref) async {
    for (int i = 0; i < 4; i++) {
      await _takePhoto(ref, i);
    }

    ref
        .read(takePhotoFlowProvider.notifier)
        .update((state) => TakePhotoFlowType.Confirming);
  }

  Widget _takePhotoButton(WidgetRef ref) {
    return SubmitButton(
      onTap: () async {
        final countDown = ref.read(countdownProvider);
        if (countDown == null) {
          await takeFourContinuousPhotos(ref);
        }
      },
      width: 343.w,
      text: '사진찍기',
      isActivate: true,
    );
  }

  Widget _reTakeAndconfirmationButton(WidgetRef ref) {
    final photoNotifier = ref.read(photoProvider.notifier);
    final photos = ref.watch(photoProvider);
    final currentPageIndex = ref.watch(currentPageIndexProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedSubmitButton(
          onTap: () async {
            await _takePhoto(ref, currentPageIndex);
          },
          width: 165.w,
          text: '다시찍기',
          isActivate: !photos[currentPageIndex].isConfirmed,
        ),
        SizedBox(width: 12.w),
        SubmitButton(
          onTap: () async {
            photoNotifier.confirmPhoto(currentPageIndex);

            if (photoNotifier.allPhotosConfirmed) {
              ref
                  .read(takePhotoFlowProvider.notifier)
                  .update((state) => TakePhotoFlowType.AfterConfirmation);
            }
          },
          width: 165.w,
          text: '확정하기',
          isActivate: true,
        ),
      ],
    );
  }

  Widget _nextButton(BuildContext context) {
    if (_isLoading) {
      return Container(
        width: 343.w,
        height: 48.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFE8A025),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      );
    }

    return SubmitButton(
      onTap: () => Throttle.run(() async {
        setState(() {
          _isLoading = true;
        });

        try {
          final photos = ref.watch(photoProvider);
          final List<File> images = [];

          for (var photo in photos) {
            images.add(photo.file!);
          }

          final result = await ref
              .read(photoViewModel.notifier)
              .savePhotos(images);

          final List<String> cutIds = [];
          for (var element in result.data) {
            cutIds.add(element.cutId);
          }

          ref.read(cutIdsProvider.notifier).update((state) => cutIds);

          if (mounted) {
            AppNavigation.gotakePhotoStep3(context);
          }
        } finally {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        }
      }),
      width: 343.w,
      text: '다음으로',
      isActivate: true,
    );
  }

  void _initCamera(WidgetRef ref) {
    ref.read(cameraControllerProvider.notifier).initCamera();
  }

  Widget _bottomButton(WidgetRef ref, BuildContext context) {
    final flow = ref.watch(takePhotoFlowProvider);

    return switch (flow) {
      TakePhotoFlowType.TakePhoto => _takePhotoButton(ref),
      TakePhotoFlowType.Confirming => _reTakeAndconfirmationButton(ref),
      TakePhotoFlowType.AfterConfirmation => _nextButton(context),
    };
  }

  Widget _title(WidgetRef ref) {
    final flow = ref.watch(takePhotoFlowProvider);

    return Text(
      flow == TakePhotoFlowType.TakePhoto
          ? '4컷 사진 촬영 시작해볼까요?'
          : '마음에 드는 사진을 골라주세요!',
      style: AppTextStyle.heading1,
    );
  }

  @override
  Widget build(BuildContext context) {
    _initCamera(ref);

    return DefaultLayout(
      appBar: CustomBackButton(onTap: () => _resetPhotoFlow(ref)),
      body: Column(
        children: [
          SizedBox(height: 6.h),
          const CurrentProgressIndicator(),
          SizedBox(height: 42.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Align(alignment: Alignment.centerLeft, child: _title(ref)),
          ),
          SizedBox(height: 26.h),
          const TakePhotoBox(),
          SizedBox(height: 9.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: 343.w,
              height: 44.h,
              child: Row(
                children: [
                  const ImportExistingPhotos(),
                  const Spacer(),
                  const PhotoStepIndicator(),
                ],
              ),
            ),
          ),
          const Spacer(),
          _bottomButton(ref, context),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
