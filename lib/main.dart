// import 'dart:developer';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
// import 'package:potato_4cut_v2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/.env");
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // final fcmToken = await FirebaseMessaging.instance.getToken(
  //   vapidKey: dotenv.env['vapidKey'],
  // );
  // log('fcmToken = $fcmToken');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        title: 'Potato 4Cut V2',
        theme: ThemeData(scaffoldBackgroundColor: AppColor.background1),
        routerConfig: router,
      ),
    );
  }
}
