import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/frame_base_image_url_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_view_model.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/save_photo_field_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/finished_photo_provider.dart';

class FinishedPhoto extends ConsumerStatefulWidget {
  const FinishedPhoto({super.key, required this.repaintBoundaryKey});

  final GlobalKey repaintBoundaryKey;

  @override
  ConsumerState<FinishedPhoto> createState() => _FinishedPhotoState();
}

class _FinishedPhotoState extends ConsumerState<FinishedPhoto> {
  bool isUploaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted && !isUploaded) {
        isUploaded = true;
        await _uploadToServer();
      }
    });
  }

  Future<void> _uploadToServer() async {
    try {
      final savePhotoField = ref.read(savePhotoFieldProvider);

      if (savePhotoField.frameId == null) {
        return;
      }

      final pngBytes = await ref
          .read(finishedPhotoProvider.notifier)
          .captureImage(widget.repaintBoundaryKey, pixelRatio: 4.0);

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
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('서버와의 통신에 실패했어요.'),
            backgroundColor: Colors.red,
          ),
        );
      }
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
