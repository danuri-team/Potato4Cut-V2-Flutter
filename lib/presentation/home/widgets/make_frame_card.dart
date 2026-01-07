import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/view_models/creator_view_model.dart';

class MakeFrameCard extends ConsumerStatefulWidget {
  const MakeFrameCard({super.key});

  @override
  ConsumerState<MakeFrameCard> createState() => _MakeFrameCardState();
}

class _MakeFrameCardState extends ConsumerState<MakeFrameCard> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading
          ? null
          : () => Throttle.run(() async {
              setState(() {
                _isLoading = true;
              });
              try {
                // 크리에이터 정보 확인
                final creatorInfo = await ref
                    .read(creatorViewModelProvider.notifier)
                    .getMyInfo();

                // 크리에이터 상태가 APPROVED인지 확인
                if (creatorInfo.data.status == 'APPROVED') {
                  // 크리에이터면 프레임 제작 페이지로 이동
                  if (context.mounted) {
                    AppNavigation.goMakeFrameStep1(context);
                  }
                } else if (creatorInfo.data.status == 'PENDING') {
                  // 대기 중인 경우
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('크리에이터 승인 대기 중입니다'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                } else if (creatorInfo.data.status == 'REJECTED') {
                  // 거절된 경우
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '크리에이터 신청이 거절되었습니다: ${creatorInfo.data.rejectionReason ?? "사유 없음"}',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } else {
                  // 기타 상태
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('크리에이터 등록이 필요합니다'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  }
                }
              } catch (e) {
                // 크리에이터가 아닌 경우 (API 오류 발생)
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('크리에이터 등록 후 이용 가능합니다'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                }
              } finally {
                if (mounted) {
                  setState(() {
                    _isLoading = false;
                  });
                }
              }
            }),
      child: Container(
        width: 343.w,
        height: 174.h,
        decoration: ShapeDecoration(
          color: Color(0xFFFAECD3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 27.h, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '프레임 만들기',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      SvgPicture.asset('assets/images/chevron_right.svg'),
                    ],
                  ),
                  SizedBox(height: 44.h),
                  Text(
                    '그림을 그려서 나만의\n프레임을 만들 수 있어요',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.30,
                      letterSpacing: 0.14,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10.56.w),
                child: SvgPicture.asset('assets/images/make_frame_potato.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
