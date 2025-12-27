import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';

class CreatorRegistrationModal extends StatefulWidget {
  const CreatorRegistrationModal({super.key});

  @override
  State<CreatorRegistrationModal> createState() =>
      _CreatorRegistrationModalState();
}

class _CreatorRegistrationModalState extends State<CreatorRegistrationModal> {
  bool serviceUseAgree = false;
  bool settlementTermsAndConditionsAgree = false;
  bool termsAndConditionsAgree = false;
  bool allAgree = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      height: 337.h,
      decoration: BoxDecoration(
        color: AppColor.background1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '크리에이터 등록',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    serviceUseAgree = !serviceUseAgree;
                    allAgree =
                        serviceUseAgree &&
                        settlementTermsAndConditionsAgree &&
                        termsAndConditionsAgree;
                  });
                },
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: ShapeDecoration(
                    color: serviceUseAgree ? const Color(0xFFA2711A) : null,
                    shape: RoundedRectangleBorder(
                      side: serviceUseAgree
                          ? BorderSide.none
                          : BorderSide(width: 1.50.w, color: AppColor.line3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: serviceUseAgree
                      ? SvgPicture.asset('assets/images/white_check.svg')
                      : SizedBox.shrink(),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '서비스 이용에 대해 확인하시겠습니까?',
                style: AppTextStyle.label1Normal.copyWith(
                  color: AppColor.label6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    settlementTermsAndConditionsAgree =
                        !settlementTermsAndConditionsAgree;
                    allAgree =
                        serviceUseAgree &&
                        settlementTermsAndConditionsAgree &&
                        termsAndConditionsAgree;
                  });
                },
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: ShapeDecoration(
                    color: settlementTermsAndConditionsAgree
                        ? const Color(0xFFA2711A)
                        : null,
                    shape: RoundedRectangleBorder(
                      side: settlementTermsAndConditionsAgree
                          ? BorderSide.none
                          : BorderSide(width: 1.50.w, color: AppColor.line3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: settlementTermsAndConditionsAgree
                      ? SvgPicture.asset('assets/images/white_check.svg')
                      : SizedBox.shrink(),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '정산 약관에 동의 하시겠습니까?',
                style: AppTextStyle.label1Normal.copyWith(
                  color: AppColor.label6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    termsAndConditionsAgree = !termsAndConditionsAgree;
                    allAgree =
                        serviceUseAgree &&
                        settlementTermsAndConditionsAgree &&
                        termsAndConditionsAgree;
                  });
                },
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: ShapeDecoration(
                    color: termsAndConditionsAgree
                        ? const Color(0xFFA2711A)
                        : null,
                    shape: RoundedRectangleBorder(
                      side: termsAndConditionsAgree
                          ? BorderSide.none
                          : BorderSide(width: 1.50.w, color: AppColor.line3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: termsAndConditionsAgree
                      ? SvgPicture.asset('assets/images/white_check.svg')
                      : SizedBox.shrink(),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '약관 동의하시겠습니까?',
                style: AppTextStyle.label1Normal.copyWith(
                  color: AppColor.label6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(thickness: 1.h, color: AppColor.interaction1),
          SizedBox(height: 16.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (allAgree) {
                      serviceUseAgree = false;
                      settlementTermsAndConditionsAgree = false;
                      termsAndConditionsAgree = false;
                    } else {
                      serviceUseAgree = true;
                      settlementTermsAndConditionsAgree = true;
                      termsAndConditionsAgree = true;
                    }
                    allAgree = !allAgree;
                  });
                },
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: ShapeDecoration(
                    color: allAgree ? const Color(0xFFA2711A) : null,
                    shape: RoundedRectangleBorder(
                      side: allAgree
                          ? BorderSide.none
                          : BorderSide(width: 1.50.w, color: AppColor.line3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: allAgree
                      ? SvgPicture.asset('assets/images/white_check.svg')
                      : SizedBox.shrink(),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '전체 동의',
                style: AppTextStyle.label1Normal.copyWith(
                  color: AppColor.label6,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 28.h),
          SubmitButton(
            onTap: () {},
            width: 327.w,
            text: '확인',
            isActivate: allAgree,
          ),
        ],
      ),
    );
  }
}
