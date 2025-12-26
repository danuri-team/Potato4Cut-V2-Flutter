import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadFrame extends ConsumerStatefulWidget {
  final String title;
  final String helpUrl;
  final File? selectedFile;
  final ValueChanged<File?>? onFileSelected;
  final bool isRequired;

  const UploadFrame({
    super.key,
    required this.title,
    required this.helpUrl,
    this.selectedFile,
    this.onFileSelected,
    this.isRequired = false,
  });

  @override
  ConsumerState<UploadFrame> createState() => _UploadFrameState();
}

class _UploadFrameState extends ConsumerState<UploadFrame> {
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      widget.onFileSelected?.call(File(pickedFile.path));
    }
  }

  void _removeImage() {
    widget.onFileSelected?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: AppTextStyle.body1Normal.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.isRequired) ...[
                  SizedBox(width: 2.w),
                  Text(
                    '*',
                    style: AppTextStyle.body1Normal.copyWith(
                      color: AppColor.status3,
                    ),
                  ),
                ],
              ],
            ),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse(widget.helpUrl)),
              child: Row(
                children: [
                  Text(
                    "가이드 보러가기",
                    style: AppTextStyle.caption1.copyWith(
                      color: AppColor.label3,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  SvgPicture.asset(
                    'assets/images/chevron_right.svg',
                    width: 16.w,
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: widget.selectedFile == null ? _pickImage : null,
          child: Container(
            width: 343.w,
            height: 358.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.line3),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: widget.selectedFile != null
                ? _buildSelectedImage()
                : _buildPlaceholder(),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/add_attachment.svg"),
        SizedBox(height: 16.h),
        Text(
          "이미지 가져오기",
          style: AppTextStyle.body1Normal.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColor.label2,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            widget.selectedFile!,
            width: 343.w,
            height: 358.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: GestureDetector(
            onTap: _removeImage,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20.w),
            ),
          ),
        ),
      ],
    );
  }
}
