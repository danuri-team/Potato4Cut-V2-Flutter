import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/sortby_type.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/domain/library/entities/response/possession_products_response_entity.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/selected_frame_provider.dart';
import 'package:potato_4cut_v2/presentation/view_models/library_view_model.dart';

class FrameList extends ConsumerStatefulWidget {
  const FrameList({super.key});

  @override
  ConsumerState<FrameList> createState() => _FrameListState();
}

class _FrameListState extends ConsumerState<FrameList> {
  bool _isExpanded = false;

  PossessionProductsResponseEntity? possessionProducts;

  List<LibraryFrameDataEntity> possessionProductsContent = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => onScroll());
    getPossessionProducts(0);
  }

  onScroll() {
    if (possessionProducts!.data.hasNext &&
        scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
      // getPossessionProducts(possessionProducts!.data.currentPage+1);
      setState(() {
        items += List.generate(3, (index) {
          return items.length + index + 1;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  var items = List.generate(12, (index) => index + 1);

  Future<void> getPossessionProducts(int page) async {
    final response = await ref
        .read(libraryViewModelProvider.notifier)
        .getPossessionProducts(
          false,
          page,
          12,
          SortbyType.addedAt,
          DirectionType.DESC,
        );
    setState(() {
      possessionProducts = response;
      possessionProductsContent.addAll(response.data.content);
    });
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final selectedFrame = ref.watch(selectedFrameProvider);
    return Column(
      children: [
        SizedBox(
          width: 343.w,
          height: 490.h,
          child: Stack(
            children: [
              GridView.builder(
                controller: scrollController,
                physics: _isExpanded
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemCount: possessionProducts?.data.content.length ?? 9,
                // itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 13.w,
                  mainAxisSpacing: 14.h,
                  childAspectRatio: 106.w / 154.h,
                ),
                itemBuilder: (context, index) {
                  // return Container(
                  //   decoration: ShapeDecoration(
                  //     color: Color(0xFFF5F5F5),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //   ),
                  //   alignment: Alignment.center,
                  //   child: Text('${items[index]}'),
                  // );
                  if (possessionProducts == null) {
                    return Container(
                      decoration: ShapeDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/loading_frame.svg',
                      ),
                    );
                  } else {
                    final previewImageUrl =
                        possessionProductsContent[index].previewImageUrl;
                    final frameId = possessionProductsContent[index].frameId;
                    final frameBaseImageUrl =
                        possessionProductsContent[index].frameBaseImageUrl;
                    return GestureDetector(
                      onTap: () {
                        if (selectedFrame == null) {
                          ref
                              .read(selectedFrameProvider.notifier)
                              .update(
                                (state) => FrameModel(
                                  frameId,
                                  frameBaseImageUrl,
                                ),
                              );
                        } else {
                          ref
                              .read(selectedFrameProvider.notifier)
                              .update((state) => null);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(previewImageUrl),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: (selectedFrame != null)
                            ? SvgPicture.asset(
                                'assets/images/check.svg',
                                width: 40.w,
                                height: 40.h,
                              )
                            : SizedBox.shrink(),
                      ),
                    );
                  }
                },
              ),
              if (possessionProducts == null ||
                  (!_isExpanded && possessionProducts!.data.content.length > 9))
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 343.w,
                    height: 80.h,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (!_isExpanded &&
            (possessionProducts?.data.content.length ?? 0) > 9) ...[
          SizedBox(height: 14.h),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = true;
              });
            },
            child: SizedBox(
              width: 58.w,
              height: 28.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '더보기',
                    style: AppTextStyle.label1Normal.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.label3,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  SvgPicture.asset('assets/images/circle_plus.svg'),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
