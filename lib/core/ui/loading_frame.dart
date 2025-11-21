import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';

class LoadingFrame extends StatelessWidget {
  const LoadingFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106.w,
      height: 154.h,
      decoration: ShapeDecoration(
        color: AppColor.fill1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset('assets/images/loading_frame.svg'),
    );
  }
}
