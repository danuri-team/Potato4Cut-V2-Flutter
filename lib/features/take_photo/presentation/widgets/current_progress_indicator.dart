import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';

class CurrentProgressIndicator extends StatelessWidget {
  const CurrentProgressIndicator({super.key});

  int currentPageIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final String path = state.uri.path;
    if (path == RoutePath.takePhotoStep1) return 1;
    if (path == RoutePath.takePhotoStep2) return 2;
    if (path == RoutePath.takePhotoStep3) return 3;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = currentPageIndex(context);
    double width = 0;
    switch (pageIndex) {
      case 3:
        width = 343.w;
        break;
      case 2:
        width = 190.w;
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
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              Text(
                '2',
                style: TextStyle(
                  color: Color(0x4737383C),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              Text(
                '3',
                style: TextStyle(
                  color: Color(0x4737383C),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
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
