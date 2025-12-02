import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onTap,
    this.prefixSvg,
    this.suffixSvg,
    this.isAlternative,
    required this.width,
    required this.text,
    required this.isActivate,
  });

  final double width;
  final bool? isAlternative;
  final SvgPicture? prefixSvg;
  final SvgPicture? suffixSvg;
  final String text;
  final bool isActivate;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (isActivate || isAlternative == true) ? onTap : () {},
      child: Container(
        width: width,
        height: 48.h,
        decoration: ShapeDecoration(
          color: isAlternative == true
              ? Colors.transparent
              : (isActivate ? const Color(0xFFE8A025) : AppColor.fill2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isAlternative == true
                ? BorderSide(color: AppColor.line3, width: 1.5)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixSvg != null) ...[prefixSvg!, SizedBox(width: 6.w)],
            Text(
              text,
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
                color: isAlternative == true
                    ? AppColor.label3
                    : (isActivate ? AppColor.static1 : AppColor.label4),
              ),
            ),
            if (suffixSvg != null) ...[SizedBox(width: 6.w), suffixSvg!],
          ],
        ),
      ),
    );
  }
}
