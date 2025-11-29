import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class OutlinedSubmitButton extends StatelessWidget {
  const OutlinedSubmitButton({
    super.key,
    required this.onTap,
    this.prefixSvg,
    this.suffixSvg,
    required this.width,
    required this.text,
    required this.isActivate,
  });

  final double width;
  final SvgPicture? prefixSvg;
  final SvgPicture? suffixSvg;
  final String text;
  final bool isActivate;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActivate ? onTap : () {},
      child: Container(
        width: width,
        height: 48.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(width: 1, color: AppColor.line2),
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
                color: isActivate ? Color(0xFFE8A025) : AppColor.label1,
              ),
            ),
            if (suffixSvg != null) ...[SizedBox(width: 6.w), suffixSvg!],
          ],
        ),
      ),
    );
  }
}
