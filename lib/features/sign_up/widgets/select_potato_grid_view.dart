import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/provider/potato_facial_expression_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class SelectPotatoGridView extends ConsumerWidget {
  const SelectPotatoGridView({super.key});

  selectPotato(WidgetRef ref, String asset) {
    ref.read(potatoAssetProvider.notifier).update((state) => asset);
  }

  reselectPotato(WidgetRef ref) {
    ref.read(potatoAssetProvider.notifier).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPotato = ref.watch(potatoAssetProvider);
    return SizedBox(
      width: 343.w,
      height: 476.h,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 9.5.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 108.w / 110.h,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          final potatoAsset = 'potato_facial_expression${index + 1}.svg';
          return GestureDetector(
            onTap: () {
              if (currentPotato == potatoAsset) {
                reselectPotato(ref);
              } else {
                selectPotato(ref, potatoAsset);
              }
            },
            child: Container(
              width: 108.w,
              height: 110.h,
              decoration: ShapeDecoration(
                color: (currentPotato == potatoAsset)
                    ? const Color(0xFFFAECD3)
                    : AppColor.background2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: (currentPotato == potatoAsset)
                      ? BorderSide(width: 1, color: const Color(0xFFE8A025))
                      : BorderSide.none,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/$potatoAsset',
                      width: 60.w,
                      height: 60.h,
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      '${index + 1}',
                      style: AppTextStyle.caption1.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.label3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
