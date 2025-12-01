import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/features/sign_up/domain/entities/profile_preset_entity.dart';
import 'package:potato_4cut_v2/features/sign_up/provider/assets_view_model.dart';
import 'package:potato_4cut_v2/features/sign_up/provider/sign_up_field_provider.dart';

class ProfilePresets extends ConsumerStatefulWidget {
  const ProfilePresets({super.key});

  @override
  ConsumerState<ProfilePresets> createState() => _ProfilePresetsState();
}

class _ProfilePresetsState extends ConsumerState<ProfilePresets> {
  ProfilePresetEntity? profilePreset;

  void selectProfilePreset(
    WidgetRef ref,
    String profilePresetId,
    String? currentProfilePresetId,
  ) {
    if (currentProfilePresetId == profilePresetId) {
      ref
          .read(signUpFieldProvider.notifier)
          .addSignUpField(profilePresetId: null);
    } else {
      ref
          .read(signUpFieldProvider.notifier)
          .addSignUpField(profilePresetId: profilePresetId);
    }
  }

  getProfilePreset() async {
    final viewModel = ref.read(assetsViewModelProvider);
    profilePreset = await viewModel.getProfilePreset();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProfilePreset();
  }

  @override
  Widget build(BuildContext context) {
    final signUpField = ref.watch(signUpFieldProvider);
    return SizedBox(
      width: 343.w,
      height: 560.h,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 9.5.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 108.w / 128.h,
        ),
        itemCount: profilePreset?.data.length,
        itemBuilder: (context, index) {
          if (profilePreset == null) {
            return Center(child: CircularProgressIndicator());
          } else if (profilePreset!.data.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final currentProfilePresetId = signUpField.profilePresetId;
          final profilePresetId = profilePreset!.data[index].id;
          final title = profilePreset!.data[index].title;
          final imgUrl = profilePreset!.data[index].imgUrl;
          return GestureDetector(
            onTap: () => selectProfilePreset(
              ref,
              profilePresetId,
              currentProfilePresetId,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: ShapeDecoration(
                color: (currentProfilePresetId == profilePresetId)
                    ? const Color(0xFFFAECD3)
                    : AppColor.background2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: (currentProfilePresetId == profilePresetId)
                      ? BorderSide(width: 1, color: const Color(0xFFE8A025))
                      : BorderSide.none,
                ),
              ),
              child: Column(
                children: [
                  SvgPicture.network(imgUrl),
                  const Spacer(),
                  Text(
                    title,
                    style: AppTextStyle.caption1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: (currentProfilePresetId == profilePresetId)
                          ? const Color(0xFFE8A025)
                          : AppColor.label3,
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
}
