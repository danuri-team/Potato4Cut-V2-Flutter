import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  Future<void> share() async {
    //예시 이미지
    final photo1 = await ImagePicker().pickImage(source: ImageSource.gallery);

    SharePlus.instance.share(ShareParams(files: [photo1!, photo1]));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await share();
      },
      child: Container(
        width: 166.w,
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
            SvgPicture.asset('assets/images/frame_share.svg'),
            SizedBox(width: 6.w),
            Text(
              '공유하기',
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.label3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
