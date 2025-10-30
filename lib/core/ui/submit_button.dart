import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onTap,
    this.svg,
    required this.width,
    required this.text,
    required this.isActivate,
  });

  final double width;
  final SvgPicture? svg;
  final String text;
  final bool isActivate;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isActivate ? const Color(0xFFEEB752) : AppColor.fill2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svg != null) svg!,
            SizedBox(width: 6.w),
            Text(
              text,
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
                color: isActivate ? AppColor.static1 : AppColor.label4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
