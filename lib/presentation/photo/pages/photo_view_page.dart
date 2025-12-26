import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/enum/photo_flow_type.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/presentation/photo/widgets/import_existing_photos.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/current_page_index_provider.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_flow_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/photo_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class PhotoViewPage extends ConsumerStatefulWidget {
  const PhotoViewPage({super.key});

  @override
  ConsumerState<PhotoViewPage> createState() => PhotoViewPageState();
}

class PhotoViewPageState extends ConsumerState<PhotoViewPage> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final pageIndex = pageController.page?.round() ?? 0;
      ref.read(currentPageIndexProvider.notifier).update((state) => pageIndex);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Widget _photoView() {
    final photos = ref.watch(photoProvider);
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    return SizedBox(
      width: double.infinity,
      height: 636.h,
      child: PageView.builder(
        controller: pageController,
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photoItem = photos[index];
          return GestureDetector(
            onTap: () {
              if (!photoItem.isConfirmed) {
                ref.read(photoProvider.notifier).toggleConfirmPhoto(index);
                final allPhotosConfirmed = ref
                    .read(photoProvider.notifier)
                    .allPhotosConfirmed;

                if (allPhotosConfirmed) {
                  ref
                      .read(photoFlowProvider.notifier)
                      .update((state) => PhotoFlowType.Finish);
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.static2,
                image: photoItem.file != null
                    ? DecorationImage(
                        image: FileImage(photoItem.file!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  SafeArea(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      margin: EdgeInsets.only(top: 14.h),
                      height: 46.h,
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Throttle.run(() async {
                            AppNavigation.goSelectFrame(context);
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/images/chevron_left.svg',
                          colorFilter: ColorFilter.mode(AppColor.static1, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  if (photoItem.isConfirmed)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/white_check.svg'),
                          SizedBox(height: 12.h),
                          Text(
                            '확정',
                            style: AppTextStyle.ownglyph.copyWith(
                              color: AppColor.static1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      width: 48.w,
                      height: 30.h,
                      decoration: ShapeDecoration(
                        color: Colors.white.withValues(alpha: 0.50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${currentPageIndex + 1}/${photos.length}',
                        style: AppTextStyle.caption2.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _reTakeAndconfirmationButton(WidgetRef ref) {
    final photos = ref.watch(photoProvider);
    final currentPageIndex = ref.watch(currentPageIndexProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (!photos[currentPageIndex].isConfirmed) {
              AppNavigation.goCameraView(context);
            }
          },
          child: Container(
            width: 165.5,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColor.label2,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              '다시찍기',
              style: AppTextStyle.body1Normal.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.static1,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        SubmitButton(
          onTap: () async {
            if (!photos[currentPageIndex].isConfirmed) {
              ref
                  .read(photoProvider.notifier)
                  .toggleConfirmPhoto(currentPageIndex);
              final allPhotosConfirmed = ref
                  .read(photoProvider.notifier)
                  .allPhotosConfirmed;

              if (allPhotosConfirmed) {
                ref
                    .read(photoFlowProvider.notifier)
                    .update((state) => PhotoFlowType.Finish);
              }
            }
          },
          width: 165.w,
          text: '확정하기',
          isActivate: true,
        ),
      ],
    );
  }

  Widget _nextButton(BuildContext context) {
    return SubmitButton(
      onTap: () => Throttle.run((){
        AppNavigation.goFinishedPhoto(context);
      }),
      width: 343.w,
      text: '다음으로',
      isActivate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final photoFlowType = ref.watch(photoFlowProvider);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        AppNavigation.goSelectFrame(context);
      },
      child: DefaultLayout(
        top: false,
        body: Column(
          children: [
            _photoView(),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: 343.w,
                height: 36.h,
                child: Row(
                  children: [
                    ImportExistingPhotos(),
                    const Spacer(),
                    SizedBox(
                      width: 21.326.w,
                      height: 26.666.h,
                      child: GridView.builder(
                        itemCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.666.w,
                          mainAxisSpacing: 2.666.h,
                          childAspectRatio: 9.33.w / 12.h,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: index == currentPageIndex
                                  ? AppColor.m300
                                  : const Color(0xFFDEDEE0),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            (photoFlowType == PhotoFlowType.Updating)
                ? _reTakeAndconfirmationButton(ref)
                : _nextButton(context),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
