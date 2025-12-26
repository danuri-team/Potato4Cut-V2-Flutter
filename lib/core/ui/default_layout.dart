import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.top = true,
    this.left = true,
    this.right = true,
    this.bottom = true,
  });

  final Widget? appBar;
  final Widget body;
  final BottomNavigationBar? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final bool top;
  final bool left;
  final bool right;
  final bool bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  margin: EdgeInsets.only(top: 14.h),
                  height: 46.h,
                  alignment: Alignment.centerLeft,
                  child: appBar,
                ),
              ),
            ),
      body: SafeArea(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
