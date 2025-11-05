import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/presentation/widgets/loading_frame.dart';

class GalleryFrameList extends StatelessWidget {
  const GalleryFrameList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 11.4.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 106.w / 178.h,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              const LoadingFrame(),
              SizedBox(height: 8.h),
              Text('프레임 ${index + 1}', style: AppTextStyle.caption1),
            ],
          );
        },
      ),
    );
  }
}
