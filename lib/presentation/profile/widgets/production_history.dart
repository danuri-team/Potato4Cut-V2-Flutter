import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/filter.dart';
import 'package:potato_4cut_v2/core/ui/loading_frame.dart';

class ProductionHistory extends StatelessWidget {
  const ProductionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Text('제작 내역', style: AppTextStyle.headLine2),
              const Spacer(),
              const Filter(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: SizedBox(
            width: double.infinity,
            height: 199.h,
            child: ListView.separated(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoadingFrame(),
                    SizedBox(height: 8.h),

                    Text('프레임 이름 ${index + 1}', style: AppTextStyle.caption1),
                    SizedBox(height: 4.h),
                    Text(
                      '${NumberFormat('###,###,###,###').format((index + 1) * 1000)}원',
                      style: AppTextStyle.caption2.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
            ),
          ),
        ),
      ],
    );
  }
}
