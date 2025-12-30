import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/finished_photo_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/save_photo_field_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareBottomSheet extends ConsumerStatefulWidget {
  const ShareBottomSheet({super.key});

  @override
  ConsumerState<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends ConsumerState<ShareBottomSheet> {
  bool linkShare = false;
  bool onlyMe = true;

  Future<void> share(File photo, BuildContext context) async {
    final xfile = XFile(photo.path);
    SharePlus.instance.share(ShareParams(files: [xfile]));
  }

  int? expirationHour;
  int? expirationMinute;

  @override
  Widget build(BuildContext context) {
    final finishedPhoto = ref.watch(finishedPhotoProvider);
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 24.w,
        right: 24.w,
        bottom: 32.h,
      ),
      height: 198.h,
      decoration: BoxDecoration(
        color: AppColor.background1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '공개 범위',
                    style: AppTextStyle.label2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          linkShare = !linkShare;
                          onlyMe = !onlyMe;
                          ref
                              .read(savePhotoFieldProvider.notifier)
                              .updateField(
                                photoShareType: PhotoShareType.PRIVATE,
                              );
                        }),
                        child: Container(
                          width: 78.w,
                          height: 32.h,
                          decoration: ShapeDecoration(
                            color: onlyMe
                                ? const Color(0xFFFDF6E9)
                                : AppColor.interaction1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '나만 보기',
                            style: AppTextStyle.label2.copyWith(
                              fontWeight: FontWeight.w600,
                              color: onlyMe
                                  ? const Color(0xFFE8A025)
                                  : AppColor.label2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () => setState(() {
                          onlyMe = !onlyMe;
                          linkShare = !linkShare;
                          ref
                              .read(savePhotoFieldProvider.notifier)
                              .updateField(photoShareType: PhotoShareType.LINK);
                        }),
                        child: Container(
                          width: 78.w,
                          height: 32.h,
                          decoration: ShapeDecoration(
                            color: linkShare
                                ? const Color(0xFFFDF6E9)
                                : AppColor.interaction1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '링크 공유',
                            style: AppTextStyle.label2.copyWith(
                              fontWeight: FontWeight.w600,
                              color: linkShare
                                  ? const Color(0xFFE8A025)
                                  : AppColor.label2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 32.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '만료 시간',
                    style: AppTextStyle.label2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: AppColor.background1,
                        child: SingleChildScrollView(
                          child: CupertinoTimerPicker(
                            onTimerDurationChanged: (value) {
                              setState(() {
                                expirationHour = value.inHours;
                                expirationMinute =
                                    value.inMinutes - 60 * expirationHour!;
                              });
                              ref
                                  .read(savePhotoFieldProvider.notifier)
                                  .updateField(
                                    expireAt:
                                        (expirationMinute! +
                                                60 * expirationHour!)
                                            .toString(),
                                  );
                            },
                            alignment: Alignment.center,
                            mode: CupertinoTimerPickerMode.hm,
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      width: 102.w,
                      height: 32.h,
                      decoration: ShapeDecoration(
                        color: AppColor.interaction1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (expirationHour == null)
                                ? '--'
                                : expirationHour.toString(),
                            style: AppTextStyle.label2.copyWith(
                              color: AppColor.label2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 23.w),
                          Text(
                            ':',
                            style: AppTextStyle.label2.copyWith(
                              color: AppColor.label2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 23.w),
                          Text(
                            (expirationMinute == null)
                                ? '--'
                                : expirationMinute.toString(),
                            style: AppTextStyle.label2.copyWith(
                              color: AppColor.label2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.h),
          SubmitButton(
            onTap: () => share(finishedPhoto!, context),
            width: 343.w,
            text: '공유하기',
            isActivate: expirationHour != null || expirationMinute != null,
            prefixSvg: SvgPicture.asset('assets/images/share.svg'),
          ),
        ],
      ),
    );
  }
}
