import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/enum/photo_flow_type.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/selected_frame_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/widgets/selected_frame.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/current_page_index_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/finished_photo_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_flow_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_provider.dart';

class CheckFramePage extends ConsumerWidget {
  const CheckFramePage({super.key});

  resetState(WidgetRef ref) {
    ref.read(photoProvider.notifier).reset();
    ref.read(currentPageIndexProvider.notifier).update((state) => 0);
    ref.read(finishedPhotoProvider.notifier).resetState();
    ref
        .read(photoFlowProvider.notifier)
        .update((state) => PhotoFlowType.TakePhoto);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appBar: CustomBackButton(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        child: Column(
          children: [
            SizedBox(height: 11.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('원하는 프레임을 선택해보세요', style: AppTextStyle.heading1),
            ),
            SizedBox(height: 38.h),
            const SelectedFrame(),
            SizedBox(height: 33.h),
            GestureDetector(
      onTap: () => Throttle.run(() {
        ref.read(selectedFrameProvider.notifier).update((state) => null);
        AppNavigation.goSelectFrame(context);
      }),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '프레임 선택하기',
            style: AppTextStyle.label1Normal.copyWith(
              color: AppColor.label2,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset('assets/images/refresh.svg'),
        ],
      ),
    ),
            const Spacer(),
            SubmitButton(
              onTap: () {
                resetState(ref);
                Throttle.run(() {
                  AppNavigation.goCameraView(context);
                });
              },
              width: 343.w,
              text: '다음으로',
              isActivate: true,
            ),
          ],
        ),
      ),
    );
  }
}
