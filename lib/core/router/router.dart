import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/features/login/presentation/pages/login_page.dart';
import 'package:potato_4cut_v2/features/splash/presentation/pages/splash_page.dart';
import 'package:potato_4cut_v2/core/ui/bottom_nav_bar.dart';
import 'package:potato_4cut_v2/features/home/presentation/pages/home_page.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/pages/take_photo_step1_page.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/pages/take_photo_step2_page.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/pages/take_photo_step3_page.dart';

final GlobalKey<NavigatorState> routerNavigationKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> shellNavigationKey =
    GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: routerNavigationKey,
  initialLocation: RoutePath.takePhotoStep1,
  routes: [
    GoRoute(
      path: RoutePath.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutePath.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutePath.takePhotoStep1,
      builder: (context, state) => const TakePhotoStep1Page(),
    ),
    GoRoute(
      path: RoutePath.takePhotoStep2,
      builder: (context, state) => const TakePhotoStep2Page(),
    ),
    GoRoute(
      path: RoutePath.takePhotoStep3,
      builder: (context, state) => const TakePhotoStep3Page(),
    ),
    ShellRoute(
      navigatorKey: shellNavigationKey,
      builder: (context, state, child) => BottomNavBar(body: child),
      routes: [
        GoRoute(path: RoutePath.home, builder: (context, state) => HomePage()),
      ],
    ),
  ],
);
