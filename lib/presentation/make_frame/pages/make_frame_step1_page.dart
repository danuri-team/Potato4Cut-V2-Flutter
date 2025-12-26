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
import 'package:potato_4cut_v2/presentation/make_frame/widgets/upload_frame.dart';

class MakeFrameStep1Page extends ConsumerWidget {
  const MakeFrameStep1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(makeFrameStateProvider);
    final notifier = ref.read(makeFrameStateProvider.notifier);

    return DefaultLayout(
      appBar: CustomBackButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("나만의 프레임 만들기", style: AppTextStyle.headLine1),
                  Row(
                    children: [
                      Text(
                        "자세히보기",
                        style: AppTextStyle.caption1.copyWith(
                          color: AppColor.label4,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      SvgPicture.asset(
                        'assets/images/chevron_right.svg',
                        width: 16.w,
                        height: 16.h,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 21.h),
              UploadFrame(
                title: "베이스 프레임",
                helpUrl: "https://google.com",
                isRequired: true,
                selectedFile: state.baseFrameFile,
                onFileSelected: (file) {
                  if (file != null) {
                    notifier.setBaseFrame(file);
                  }
                },
              ),
              SizedBox(height: 29.h),
              UploadFrame(
                title: "오버레이 프레임",
                helpUrl: "https://google.com",
                selectedFile: state.overlayFrameFile,
                onFileSelected: (file) {
                  notifier.setOverlayFrame(file);
                },
              ),
              SizedBox(height: 35.h),
              SubmitButton(
                onTap: () {
                  if (notifier.isStep1Valid) {
                    AppNavigation.goMakeFrameStep2(context);
                  }
                },
                width: 344.w,
                text: "다음으로",
                isActivate: notifier.isStep1Valid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
