import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/features/user/domain/entities/response/my_info_response_entity.dart';
import 'package:potato_4cut_v2/features/user/provider/users_view_model.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});

  @override
  ConsumerState<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  MyInfoResponseEntity? myInfo;

  @override
  void initState() {
    super.initState();
    getMyInfo();
  }

  Future<void> getMyInfo() async {
    myInfo = await ref.read(usersProvider.notifier).getMyInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.r,
          height: 60.r,
          decoration: ShapeDecoration(
            image: (myInfo == null || myInfo?.data.profileImageUrl == null)
                ? null
                : DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(myInfo!.data.profileImageUrl!),
                  ),
            shape: OvalBorder(
              side: BorderSide(width: 1, color: AppColor.line1),
            ),
          ),
        ),
        SizedBox(width: 13.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (myInfo == null) ? '' : myInfo!.data.nickname,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                (myInfo == null)
                    ? SizedBox.shrink()
                    : SvgPicture.asset(
                        myInfo?.data.provider == AuthProviderType.GOOGLE
                            ? 'assets/images/google_auth_logo.svg'
                            : 'assets/images/apple_auth_logo.svg',
                        width: 10.w,
                        height: 10.h,
                      ),
                SizedBox(width: 4.w),
                Text(
                  (myInfo == null) ? '' : myInfo!.data.email,
                  style: AppTextStyle.caption1.copyWith(
                    color: const Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset('assets/images/chevron_right.svg'),
      ],
    );
  }
}
