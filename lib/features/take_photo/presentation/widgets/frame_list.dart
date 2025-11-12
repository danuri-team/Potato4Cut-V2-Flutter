import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class FrameList extends StatefulWidget {
  const FrameList({super.key});

  @override
  State<FrameList> createState() => _FrameListState();
}

class _FrameListState extends State<FrameList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 343.w,
          height: _isExpanded ? 490.h : 440.h,
          child: Stack(
            children: [
              GridView.builder(
                physics: _isExpanded
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 13.w,
                  mainAxisSpacing: 14.h,
                  childAspectRatio: 106.w / 154.h,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: ShapeDecoration(
                      color: Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/images/loading_frame.svg'),
                  );
                },
              ),
              if (!_isExpanded)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 343.w,
                    height: 80.h,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (!_isExpanded) ...[
          SizedBox(height: 14.h),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = true;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '더보기',
                  style: AppTextStyle.label1Normal.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.label3,
                  ),
                ),
                SizedBox(width: 4.w),
                SvgPicture.asset('assets/images/circle_plus.svg'),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
