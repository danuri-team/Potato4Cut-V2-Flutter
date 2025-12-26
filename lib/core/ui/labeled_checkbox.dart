import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = enabled ? AppColor.label4 : AppColor.label1;
    final checkboxColor = enabled ? AppColor.line3 : AppColor.line2;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: enabled ? () => onChanged?.call(!value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCheckbox(checkboxColor),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              label,
              style: AppTextStyle.label1Normal.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(Color borderColor) {
    return Container(
      width: 16.w,
      height: 16.w,
      decoration: BoxDecoration(
        color: value ? AppColor.m300 : Colors.transparent,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: value ? AppColor.m300 : borderColor,
          width: 1.5,
        ),
      ),
      child: value
          ? Icon(
              Icons.check,
              size: 12.w,
              color: Colors.white,
            )
          : null,
    );
  }
}
