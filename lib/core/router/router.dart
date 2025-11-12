import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/features/gallery/presentation/pages/gallery_page.dart';
import 'package:potato_4cut_v2/features/login/presentation/pages/login_page.dart';
import 'package:potato_4cut_v2/features/profile/presentation/pages/profile_page.dart';
import 'package:potato_4cut_v2/features/profile/presentation/pages/puchase_and_production_history_page.dart';
import 'package:potato_4cut_v2/features/sign_up/pages/sign_up_step1_page.dart';
import 'package:potato_4cut_v2/features/sign_up/pages/sign_up_step2_page.dart';
import 'package:potato_4cut_v2/features/sign_up/pages/sign_up_step3_page.dart';
import 'package:potato_4cut_v2/features/splash/presentation/pages/splash_page.dart';
import 'package:potato_4cut_v2/core/ui/bottom_nav_bar.dart';
import 'package:potato_4cut_v2/features/home/presentation/pages/home_page.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/pages/take_photo_step1_page.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/pages/take_photo_step2_page.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/pages/take_photo_step3_page.dart';
import 'package:potato_4cut_v2/features/take_photo/presentation/pages/take_photo_step4_page.dart';

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
      path: RoutePath.signUpStep1,
      builder: (context, state) => const SignUpStep1Page(),
    ),
    GoRoute(
      path: RoutePath.signUpStep2,
      builder: (context, state) => const SignUpStep2Page(),
    ),
    GoRoute(
      path: RoutePath.signUpStep3,
      builder: (context, state) => const SignUpStep3Page(),
    ),
    GoRoute(
      path: RoutePath.purchaseAndProductionHistory,
      builder: (context, state) => const PuchaseAndProductionHistoryPage(),
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
    GoRoute(
      path: RoutePath.takePhotoStep4,
      builder: (context, state) => const TakePhotoStep4Page(),
    ),
    ShellRoute(
      navigatorKey: shellNavigationKey,
      builder: (context, state, child) => BottomNavBar(body: child),
      routes: [
        GoRoute(
          path: RoutePath.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: RoutePath.profile,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: RoutePath.gallery,
          builder: (context, state) => const GalleryPage(),
        ),
      ],
    ),
  ],
);
