import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/presentation/make_frame/provider/make_frame_state_provider.dart';

class MakeFrameStep3Page extends ConsumerWidget {
  const MakeFrameStep3Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(makeFrameStateProvider);

    return DefaultLayout(
      appBar: CustomBackButton(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("관리자 검수를 기다려주세요!", style: AppTextStyle.title3),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPreviewImage(state),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.tags.isNotEmpty) ...[
                                Wrap(
                                  spacing: 8.w,
                                  runSpacing: 8.h,
                                  children: state.tags.map((tag) => Tag(text: tag)).toList(),
                                ),
                                SizedBox(height: 12.h),
                              ],
                              Text(
                                state.title.isNotEmpty ? state.title : "프레임 이름",
                                style: AppTextStyle.heading2,
                              ),
                              SizedBox(height: 40.h),
                              Text(
                                state.isFree ? "무료" : "${state.price}원",
                                style: AppTextStyle.title3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text("설명", style: AppTextStyle.heading1),
                    SizedBox(height: 16.h),
                    Text(
                      state.description.isNotEmpty ? state.description : "설명 없음",
                      style: AppTextStyle.body1Reading,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomSection(context, ref),
        ],
      ),
    );
  }

  Widget _buildPreviewImage(MakeFrameState state) {
    return Container(
      width: 162.w,
      height: 232.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.line1, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11.r),
        child: state.baseFrameFile != null
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    state.baseFrameFile!,
                    fit: BoxFit.cover,
                  ),
                  if (state.overlayFrameFile != null)
                    Image.file(
                      state.overlayFrameFile!,
                      fit: BoxFit.cover,
                    ),
                ],
              )
            : Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 48.w,
                  color: AppColor.label2,
                ),
              ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/info.svg"),
              SizedBox(width: 8.w),
              Text(
                "마이페이지에서 확인이 가능합니다.",
                style: AppTextStyle.label1Normal.copyWith(
                  fontWeight: FontWeight.w200,
                  color: AppColor.label2,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
              child: SubmitButton(
                onTap: () {
                  ref.read(makeFrameStateProvider.notifier).reset();
                  AppNavigation.goHome(context);
                },
                width: double.infinity,
                text: '확인',
                isActivate: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;
  const Tag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColor.m300.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColor.m300.withValues(alpha: 0.45)),
      ),
      child: Text(
        "#$text",
        style: AppTextStyle.caption1.copyWith(color: AppColor.m300),
      ),
    );
  }
}
