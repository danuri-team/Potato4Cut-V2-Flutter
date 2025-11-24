import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/features/take_photo/provider/photo_provider.dart';

class PhotoStepIndicator extends ConsumerWidget {
  const PhotoStepIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(photoProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.33.w, vertical: 2.67.h),
      width: 32.w,
      height: 32.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.66.w,
          mainAxisSpacing: 2.66.h,
          childAspectRatio: 9.33.w / 12.h,
        ),
        itemBuilder: (context, index) {
          final photoCount = ref.read(photoProvider.notifier).photoCount;
          return Container(
            decoration: BoxDecoration(
              color: index < photoCount
                  ? const Color(0xFF000000)
                  : const Color(0xFFC7C7C9),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        },
      ),
    );
  }
}
