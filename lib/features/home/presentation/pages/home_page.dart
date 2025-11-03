import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_search_bar.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/features/home/presentation/widgets/make_frame_card.dart';
import 'package:potato_4cut_v2/features/home/presentation/widgets/take_photo_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('감자네컷', style: AppTextStyle.logoText.copyWith(fontSize: 22.sp)),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/images/bell.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const CustomSearchBar(),
              SizedBox(height: 20.h),
              const TakePhotoCard(),
              SizedBox(height: 20.h),
              const MakeFrameCard(),
            ],
          ),
        ),
      ),
    );
  }
}
