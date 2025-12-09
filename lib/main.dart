import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: "assets/config/.env");
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final config = ClarityConfig(
      projectId: dotenv.env['clarityProjectId']!,
      logLevel: LogLevel.Error,
    );
    return ClarityWidget(
      clarityConfig: config,
      app: ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp.router(
            title: 'Potato 4Cut V2',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.background1,
              splashColor: Colors.transparent,
            ),
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}
