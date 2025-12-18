import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/features/gallery/presentation/pages/gallery_page.dart';
import 'package:potato_4cut_v2/features/user/presentation/pages/login_page.dart';
import 'package:potato_4cut_v2/features/user/presentation/pages/profile_page.dart';
import 'package:potato_4cut_v2/features/library/presentation/pages/puchase_and_production_history_page.dart';
import 'package:potato_4cut_v2/features/user/presentation/pages/sign_up_step1_page.dart';
import 'package:potato_4cut_v2/features/assets/presentation/pages/sign_up_step2_page.dart';
import 'package:potato_4cut_v2/features/user/presentation/pages/sign_up_step3_page.dart';
import 'package:potato_4cut_v2/features/splash/presentation/pages/splash_page.dart';
import 'package:potato_4cut_v2/core/ui/bottom_nav_bar.dart';
import 'package:potato_4cut_v2/features/home/presentation/pages/home_page.dart';
import 'package:potato_4cut_v2/features/photo/presentation/pages/camera_view_page.dart';
import 'package:potato_4cut_v2/features/photo/presentation/pages/photo_view_page.dart';
import 'package:potato_4cut_v2/features/photo/presentation/pages/select_frame_page.dart';
import 'package:potato_4cut_v2/features/photo/presentation/pages/finished_photo_page.dart';

final GlobalKey<NavigatorState> routerNavigationKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> shellNavigationKey =
    GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: routerNavigationKey,
  initialLocation: RoutePath.splash,
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
      path: RoutePath.selectFrame,
      builder: (context, state) => const SelectFramePage(),
    ),
    GoRoute(
      path: RoutePath.cameraView,
      builder: (context, state) => CameraViewPage(),
    ),
    GoRoute(
      path: RoutePath.photoView,
      builder: (context, state) => PhotoViewPage(),
    ),
    GoRoute(
      path: RoutePath.finishedPhoto,
      builder: (context, state) => FinishedPhotoPage(),
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
