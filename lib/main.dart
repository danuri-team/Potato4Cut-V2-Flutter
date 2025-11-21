import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:potato_4cut_v2/core/enum/social_provider.dart';
import 'package:potato_4cut_v2/core/router/router.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/data/data_sources/user_data_source.dart';
import 'package:potato_4cut_v2/data/models/request/google_login_request.dart';
import 'package:potato_4cut_v2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/.env");
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcmToken = await FirebaseMessaging.instance.getToken(
    vapidKey: dotenv.env['vapidKey'],
  );
  final GoogleSignIn googleSignInInstance = GoogleSignIn.instance;
  await googleSignInInstance.initialize();
  final account = await googleSignInInstance.authenticate();
  
  await UserDataSource().googleLogin(
    GoogleLoginRequest(
      provider: SocialProvider.GOOGLE,
      oauthToken: account.authentication.idToken!,
      deviceToken: fcmToken!,
    ),
  );
  // runApp(const App());
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
