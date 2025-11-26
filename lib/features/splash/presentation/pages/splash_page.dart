import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/features/login/provider/stoarage_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  void navigate(WidgetRef ref, BuildContext context){
    Future.delayed(const Duration(seconds: 2), () async {
      await ref.read(storageProvider.notifier).checkAuthAndNavigate(context);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    navigate(ref, context);
    return DefaultLayout(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/potato_4cut_logo.svg'),
            SizedBox(height: 12.h),
            Text('감자네컷', style: AppTextStyle.logoText),
          ],
        ),
      ),
    );
  }
}
