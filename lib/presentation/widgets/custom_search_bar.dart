import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 343.w,
      height: 48.h,
      decoration: ShapeDecoration(
        color: AppColor.fill2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: TextFormField(
        controller: textController,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onFieldSubmitted: (value) {},
        cursorColor: AppColor.label3,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: '작가, 이름, 태그 검색',
          hintStyle: AppTextStyle.body1Normal.copyWith(color: AppColor.label2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(right: 6.w),
            child: SvgPicture.asset('assets/images/serch_reading_glasses.svg'),
          ),
          prefixIconConstraints: BoxConstraints(),
        ),
      ),
    );
  }
}
