import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Potato4cutFrame extends StatelessWidget {
  const Potato4cutFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265.w,
      height: 420.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 12,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: SvgPicture.asset('assets/images/potato4cut_frame.svg'),
    );
  }
}
