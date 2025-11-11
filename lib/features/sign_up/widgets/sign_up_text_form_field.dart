import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/provider/nickname_provider.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';

class SignUpTextFormField extends ConsumerStatefulWidget {
  const SignUpTextFormField({super.key});

  @override
  ConsumerState<SignUpTextFormField> createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends ConsumerState<SignUpTextFormField> {
  final nicknameTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nicknameTextEditingController.dispose();
  }

  textOnChanged(WidgetRef ref) {
    ref
        .read(nicknameProvider.notifier)
        .update((state) => nicknameTextEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 343.w,
      height: 48.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(width: 1, color: AppColor.line2),
        ),
      ),
      child: TextFormField(
        controller: nicknameTextEditingController,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onChanged: (_) => textOnChanged(ref),
        cursorColor: AppColor.label3,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: '닉네임을 입력해주세요',
          hintStyle: AppTextStyle.body1Normal.copyWith(color: AppColor.label2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
