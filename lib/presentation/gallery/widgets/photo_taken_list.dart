import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/user_photos_response_entity.dart';
import 'package:potato_4cut_v2/presentation/view_models/users_view_model.dart';

class PhotoTakenList extends ConsumerWidget {
  PhotoTakenList({super.key});

  UserPhotosResponseEntity? userPhotos;

  void getUserPhotos(WidgetRef ref) async {
    userPhotos = await ref.read(usersProvider.notifier).getUserPhotos(0, 12);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (userPhotos == null) return Center(child: CircularProgressIndicator());
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
      child: GridView.builder(
        itemCount: userPhotos!.data.content.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3.5.w,
          mainAxisSpacing: 4.h,
          childAspectRatio: 112.w / 140.h,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: AppColor.line2),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/potato4cut_frame.svg'),
          );
          // return Column(
          //   children: [
          // const LoadingFrame(),
          //     SizedBox(height: 8.h),
          //     Text('프레임 ${index + 1}', style: AppTextStyle.caption1),
          //   ],
          // );
        },
      ),
    );
  }
}
