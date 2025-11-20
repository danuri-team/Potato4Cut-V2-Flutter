import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/presentation/views/gallery/screen/gallery_screen.dart';
import 'package:potato_4cut_v2/presentation/views/home/screen/home_screen.dart';
import 'package:potato_4cut_v2/presentation/views/login/screens/login_screen.dart';
import 'package:potato_4cut_v2/presentation/views/profile/screens/profile_screen.dart';
import 'package:potato_4cut_v2/presentation/views/profile/screens/puchase_and_production_history_screen.dart';
import 'package:potato_4cut_v2/presentation/views/splash/screen/splash_screen.dart';
import 'package:potato_4cut_v2/presentation/widgets/bottom_nav_bar.dart';

final GlobalKey<NavigatorState> routerNavigationKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> shellNavigationKey =
    GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: routerNavigationKey,
  initialLocation: RoutePath.login,
  routes: [
    GoRoute(
      path: RoutePath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePath.purchaseAndProductionHistory,
      builder: (context, state) => const PuchaseAndProductionHistoryScreen(),
    ),
    ShellRoute(
      navigatorKey: shellNavigationKey,
      builder: (context, state, child) => BottomNavBar(body: child),
      routes: [
        GoRoute(
          path: RoutePath.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: RoutePath.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: RoutePath.gallery,
          builder: (context, state) => const GalleryScreen(),
        ),
      ],
    ),
  ],
);
