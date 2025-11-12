import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class CurrentProgressIndicator extends StatelessWidget {
  const CurrentProgressIndicator({super.key});

  int currentPageIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final String path = state.uri.path;
    if (path == RoutePath.takePhotoStep1) return 1;
    if (path == RoutePath.takePhotoStep2) return 2;
    if (path == RoutePath.takePhotoStep3) return 3;
    if (path == RoutePath.takePhotoStep4) return 4;
    return 1;
  }

  Widget setPageIndex(int currentPageIndex, int setPageIndex) {
    final isCurrentPageIndex = currentPageIndex == setPageIndex;
    return Container(
      width: 28.r,
      height: 28.r,
      decoration: ShapeDecoration(
        color: isCurrentPageIndex
            ? const Color(0xFFEEB752)
            : const Color(0xFFDCDCDC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      alignment: Alignment.center,
      child: Text(
        '$setPageIndex',
        style: AppTextStyle.label1Normal.copyWith(
          color: isCurrentPageIndex ? AppColor.static1 : AppColor.label2,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = currentPageIndex(context);
    double width = 0;
    switch (pageIndex) {
      case 4:
        width = 343.w;
        break;
      case 3:
        width = 240.w;
        break;
      case 2:
        width = 137.w;
        break;
      case 1:
        width = 35.w;
        break;
    }
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          width: 343.w,
          height: 26.h,
          decoration: ShapeDecoration(
            color: Color(0xFFF7F7F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1',
                style: TextStyle(
                  color: Color(0x4737383C),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '2',
                style: TextStyle(
                  color: Color(0x4737383C),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '3',
                style: TextStyle(
                  color: Color(0x4737383C),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '4',
                style: TextStyle(
                  color: Color(0x4737383C),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: pageIndex == 1
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(horizontal: 13.w),
          width: width,
          height: 26.h,
          decoration: ShapeDecoration(
            color: Color(0xFFFAECD3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: pageIndex == 1
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: List.generate(
              pageIndex,
              (index) => Text(
                '${index + 1}',
                style: TextStyle(
                  color: const Color(0xFFE8A025),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
