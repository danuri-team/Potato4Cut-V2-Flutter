import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/frame_base_image_url_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_view_model.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/save_photo_field_provider.dart';

class FinishedPhoto extends ConsumerStatefulWidget {
  const FinishedPhoto({super.key, required this.repaintBoundaryKey});

  final GlobalKey repaintBoundaryKey;

  @override
  ConsumerState<FinishedPhoto> createState() => _FinishedPhotoState();
}

class _FinishedPhotoState extends ConsumerState<FinishedPhoto> {
  bool isUploaded = false;
  bool _imagesLoaded = false;

  @override
  void initState() {
    super.initState();
    _scheduleAutoUpload();
  }

  void _scheduleAutoUpload() {
    // 이미지 로딩 완료 후 자동 업로드
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _waitForImagesLoaded();
      if (mounted && !isUploaded) {
        isUploaded = true;
        // 추가 렌더링 대기
        await Future.delayed(const Duration(milliseconds: 200));
        await _uploadToServer();
      }
    });
  }

  Future<void> _waitForImagesLoaded() async {
    final frameBaseImageUrl = ref.read(frameBaseImageUrlProvider);
    final frameOverlayImageUrl = ref.read(frameOverlayImageUrlProvider);

    if (frameBaseImageUrl == null) return;

    final completer = Completer<void>();
    int loadedCount = 0;
    int totalImages = frameOverlayImageUrl != null ? 2 : 1;

    // Base image 로딩 대기
    final baseImage = NetworkImage(frameBaseImageUrl);
    final baseStream = baseImage.resolve(ImageConfiguration.empty);
    baseStream.addListener(ImageStreamListener(
      (info, synchronousCall) {
        loadedCount++;
        if (loadedCount >= totalImages) {
          _imagesLoaded = true;
          if (!completer.isCompleted) completer.complete();
        }
      },
      onError: (error, stackTrace) {
        if (!completer.isCompleted) completer.complete();
      },
    ));

    // Overlay image 로딩 대기 (있는 경우)
    if (frameOverlayImageUrl != null) {
      final overlayImage = NetworkImage(frameOverlayImageUrl);
      final overlayStream = overlayImage.resolve(ImageConfiguration.empty);
      overlayStream.addListener(ImageStreamListener(
        (info, synchronousCall) {
          loadedCount++;
          if (loadedCount >= totalImages) {
            _imagesLoaded = true;
            if (!completer.isCompleted) completer.complete();
          }
        },
        onError: (error, stackTrace) {
          if (!completer.isCompleted) completer.complete();
        },
      ));
    }

    // 최대 5초 대기 (타임아웃)
    await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 5)),
    ]);
  }

  Future<void> _uploadToServer() async {
    try {
      final savePhotoField = ref.read(savePhotoFieldProvider);

      if (savePhotoField.frameId == null) {
        return;
      }

      final boundary =
          widget.repaintBoundaryKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 4.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      // 파일 저장
      final dir = await getApplicationDocumentsDirectory();
      final formatDate = DateFormat("yyyy.MM.dd.HH.mm").format(DateTime.now());
      final file = File('${dir.path}/auto_$formatDate.png');
      await file.writeAsBytes(pngBytes);

      // S3에 업로드 및 서버에 저장
      await ref
          .read(photoViewModel.notifier)
          .uploadPhotoAndSave(
            imageData: pngBytes,
            frameId: savePhotoField.frameId!,
            photoShareType: PhotoShareType.PRIVATE,
            expireAt: '0',
          );
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    final frameBaseImageUrl = ref.watch(frameBaseImageUrlProvider);
    final frameOverlayImageUrl = ref.watch(frameOverlayImageUrlProvider);
    final photos = ref.watch(photoProvider);
    return SizedBox(
      width: double.infinity,
      height: 472.h,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 28.h, bottom: 13.h),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      'assets/images/finished_potato1.svg',
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      'assets/images/finished_potato2.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RepaintBoundary(
              key: widget.repaintBoundaryKey,
              child: SizedBox(
                width: 296.w,
                height: 472.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // 베이스 이미지
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(frameBaseImageUrl!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // 4컷 사진들
                    Positioned(
                      top: 18.h,
                      left: 18.w,
                      right: 18.w,
                      height: 376.h,
                      child: GridView.builder(
                        itemCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 8.h,
                          childAspectRatio: 121.w / 184.h,
                        ),
                        itemBuilder: (context, index) {
                          final photo = photos[index];
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(photo.file!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // 오버레이 이미지
                    if (frameOverlayImageUrl != null)
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(frameOverlayImageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
