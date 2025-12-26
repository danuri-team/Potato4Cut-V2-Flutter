import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class TagInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isRequired;
  final List<String> tags;
  final ValueChanged<List<String>>? onTagsChanged;
  final int maxTags;
  final bool enabled;

  const TagInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.isRequired = false,
    this.tags = const [],
    this.onTagsChanged,
    this.maxTags = 10,
    this.enabled = true,
  });

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  late List<String> _tags;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _tags = List.from(widget.tags);
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _addTag(String tag) {
    final trimmedTag = tag.trim();
    if (trimmedTag.isEmpty) return;
    if (_tags.contains(trimmedTag)) return;
    if (_tags.length >= widget.maxTags) return;

    setState(() {
      _tags.add(trimmedTag);
      _controller.clear();
    });
    widget.onTagsChanged?.call(_tags);
  }

  void _removeTag(int index) {
    setState(() {
      _tags.removeAt(index);
    });
    widget.onTagsChanged?.call(_tags);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isFocused ? AppColor.m300 : AppColor.line2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        SizedBox(height: 8.h),
        _buildInputContainer(borderColor),
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

  Widget _buildInputContainer(Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderColor, width: 1),
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
          if (_tags.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _tags.asMap().entries.map((entry) {
                  return _buildTagChip(entry.key, entry.value);
                }).toList(),
              ),
            ),
          ],
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            style: AppTextStyle.body1Normal.copyWith(color: AppColor.label6),
            decoration: InputDecoration(
              hintText: _tags.isEmpty ? widget.hintText : '태그 추가',
              hintStyle: AppTextStyle.body1Reading.copyWith(color: AppColor.label2),
              contentPadding: EdgeInsets.all(12.w),
              border: InputBorder.none,
              isDense: true,
            ),
            onChanged: (value) {
              if (value.endsWith(' ') || value.endsWith(',')) {
                _addTag(value.substring(0, value.length - 1));
              }
            },
            onSubmitted: _addTag,
          ),
        ],
      ),
    );
  }

  Widget _buildTagChip(int index, String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColor.m50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '#$tag',
            style: AppTextStyle.label2.copyWith(
              color: AppColor.m400,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 4.w),
          GestureDetector(
            onTap: () => _removeTag(index),
            child: Icon(
              Icons.close,
              size: 14.w,
              color: AppColor.m400,
            ),
          ),
        ],
      ),
    );
  }
}
