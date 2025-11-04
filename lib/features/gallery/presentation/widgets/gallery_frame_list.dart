import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class GalleryFrameList extends StatelessWidget {
  const GalleryFrameList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 348.w,
      height: 580.h,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.5.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 106.w / 178.h,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 106.w,
                height: 154.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: SvgPicture.asset(
                  'assets/images/loading_frame.svg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.h),
              Text('프레임 ${index + 1}', style: AppTextStyle.caption1),
            ],
          );
        },
      ),
    );
  }
}
