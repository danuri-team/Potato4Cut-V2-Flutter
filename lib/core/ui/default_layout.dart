import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
  });

  final Widget? appBar;
  final Widget body;
  final BottomNavigationBar? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;

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
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
