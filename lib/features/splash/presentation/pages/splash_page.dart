import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/features/login/provider/stoarage_provider.dart';
import 'package:potato_4cut_v2/firebase_options.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  void appSetting(WidgetRef ref, BuildContext context) async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Hive.initFlutter();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await ref.read(storageProvider.notifier).checkAuthAndNavigate(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    appSetting(ref, context);
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
