import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/features/take_photo/domain/entites/request/issue_4cut_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/view_model/photo_view_model.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/finished_photo_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/object_key_provider.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/photo_provider.dart';

class FinishedPhoto extends ConsumerStatefulWidget {
  const FinishedPhoto({super.key, required this.repaintBoundaryKey});

  final GlobalKey repaintBoundaryKey;

  @override
  ConsumerState<FinishedPhoto> createState() => _FinishedPhotoState();
}

class _FinishedPhotoState extends ConsumerState<FinishedPhoto> {
  bool isGenerated = false;

  @override
  void initState() {
    super.initState();
    _schedulePhotoGeneration();
  }

  void _schedulePhotoGeneration() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          if (mounted && !isGenerated) {
            isGenerated = true;
            final fileSize = await ref
                .read(finishedPhotoProvider.notifier)
                .generateFinishedPhoto(widget.repaintBoundaryKey);
            final response = await ref
                .read(photoViewModel.notifier)
                .issue4cutUploadLink(
                  Issue4cutUploadLinkRequestEntity(fileSize.toString()),
                );
            ref
                .read(objectKeyProvider.notifier)
                .update((state) => response.data.key);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                width: 286.w,
                height: 472.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                decoration: BoxDecoration(
                  color: AppColor.static1,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 250.w,
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
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/potato_4cut_logo.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '감자네컷',
                          style: AppTextStyle.ownglyph.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
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
