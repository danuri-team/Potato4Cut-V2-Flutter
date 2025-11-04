import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.appBar, required this.body});

  final Widget? appBar;
  final Widget body;

  int _currentIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final String path = state.uri.path;
    if (path == RoutePath.home) return 0;
    if (path == RoutePath.store) return 1;
    if (path == RoutePath.gallery) return 2;
    if (path == RoutePath.profile) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        AppNavigation.goHome(context);
        break;
      case 1:
        AppNavigation.goStore(context);
        break;
      case 2:
        AppNavigation.goGallery(context);
        break;
      case 3:
        AppNavigation.goProfile(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: appBar,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.background1,
        currentIndex: _currentIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        showSelectedLabels: true,
        selectedLabelStyle: AppTextStyle.caption2.copyWith(
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: const Color(0xFFE8A025),
        unselectedItemColor: AppColor.interaction2,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/bottom_nav_home.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/tapped_bottom_nav_home.svg',
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/bottom_nav_store.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/tapped_bottom_nav_store.svg',
            ),
            label: '스토어',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/bottom_nav_gallery.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/tapped_bottom_nav_gellery.svg',
            ),
            label: '갤러리',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/bottom_nav_profile.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/tapped_bottom_nav_profile.svg',
            ),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
