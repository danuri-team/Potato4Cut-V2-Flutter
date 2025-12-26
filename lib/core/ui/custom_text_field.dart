import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isRequired;
  final int? maxLength;
  final int maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? trailingButton;
  final bool showCharacterCount;
  final String? errorText;
  final bool enabled;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isRequired = false,
    this.maxLength,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.trailingButton,
    this.showCharacterCount = true,
    this.errorText,
    this.enabled = true,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _currentLength = _controller.text.length;

    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _onTextChange() {
    setState(() {
      _currentLength = _controller.text.length;
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final borderColor = hasError
        ? AppColor.status3
        : _isFocused
            ? AppColor.m300
            : AppColor.line2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        SizedBox(height: 8.h),
        _buildInputField(borderColor, hasError),
        if (hasError) ...[
          SizedBox(height: 4.h),
          Text(
            widget.errorText!,
            style: AppTextStyle.caption1.copyWith(color: AppColor.status3),
          ),
        ],
      ],
    );
  }

  Widget _buildLabel() {
    return Row(
      children: [
        Text(
          widget.label,
          style: AppTextStyle.label1Normal.copyWith(color: AppColor.label4),
        ),
        if (widget.isRequired) ...[
          SizedBox(width: 2.w),
          Text(
            '*',
            style: AppTextStyle.label1Normal.copyWith(color: AppColor.status3),
          ),
        ],
      ],
    );
  }

  Widget _buildInputField(Color borderColor, bool hasError) {
    if (widget.trailingButton != null) {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _buildTextField(
                borderColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
              ),
            ),
            widget.trailingButton!,
          ],
        ),
      );
    }

    return _buildTextField(
      borderColor,
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  Widget _buildTextField(Color borderColor, {required BorderRadius borderRadius}) {
    return Container(
      decoration: BoxDecoration(
        color: widget.enabled ? Colors.white : AppColor.interaction1,
        borderRadius: borderRadius,
        border: Border.all(color: widget.enabled ? borderColor : AppColor.line1, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            style: AppTextStyle.body1Normal.copyWith(color: AppColor.label6),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTextStyle.body1Reading.copyWith(color: AppColor.label2),
              contentPadding: EdgeInsets.all(12.w),
              border: InputBorder.none,
              counterText: '',
              isDense: true,
            ),
          ),
          if (widget.showCharacterCount && widget.maxLength != null) ...[
            Padding(
              padding: EdgeInsets.only(left: 16.w, bottom: 12.h),
              child: Text(
                '$_currentLength/${widget.maxLength}',
                style: AppTextStyle.label2.copyWith(
                  color: AppColor.label3,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class TrailingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final IconData? icon;

  const TrailingButton({
    super.key,
    required this.text,
    this.onTap,
    this.isSelected = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: 80.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.line2, width: 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null || isSelected) ...[
              Icon(
                icon ?? Icons.check,
                size: 20.w,
                color: AppColor.m300,
              ),
              SizedBox(width: 6.w),
            ],
            Text(
              text,
              style: AppTextStyle.body1Normal.copyWith(
                color: AppColor.m300,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
