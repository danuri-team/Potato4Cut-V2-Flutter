import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class CurrentPageIndexBar extends StatelessWidget {
  const CurrentPageIndexBar({super.key});

  int currentPageIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final String path = state.uri.path;
    if (path == RoutePath.takePhotoStep1) return 1;
    if (path == RoutePath.takePhotoStep2) return 2;
    if (path == RoutePath.takePhotoStep3) return 3;
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

  Widget horizontalDottedLine() {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: 129.5.w,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: AppColor.label1,
      dashGapLength: 4.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = currentPageIndex(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      width: 343.w,
      height: 36.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          setPageIndex(pageIndex, 1),
          horizontalDottedLine(),
          setPageIndex(pageIndex, 2),
          horizontalDottedLine(),
          setPageIndex(pageIndex, 3),
        ],
      ),
    );
  }
}