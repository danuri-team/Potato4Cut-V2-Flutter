import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/features/login/presentation/pages/login_page.dart';
import 'package:potato_4cut_v2/features/splash/presentation/pages/splash_page.dart';
import 'package:potato_4cut_v2/core/ui/bottom_nav_bar.dart';
import 'package:potato_4cut_v2/features/home/presentation/pages/home_page.dart';

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
    GoRoute(path: RoutePath.login, builder: (context, state) => LoginPage()),
    ShellRoute(
      navigatorKey: shellNavigationKey,
      builder: (context, state, child) => BottomNavBar(body: child),
      routes: [
        GoRoute(path: RoutePath.home, builder: (context, state) => HomePage()),
      ],
    ),
  ],
);
