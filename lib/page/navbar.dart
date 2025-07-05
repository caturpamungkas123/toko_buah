import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:toko_buah/page/home/account/main_page_account.dart';
import 'package:toko_buah/page/home/chart_main_page.dart';
import 'package:toko_buah/page/home/explore_main_page.dart';
import 'package:toko_buah/page/home/favorite/main_page_favorite.dart';
import 'package:toko_buah/page/home/main_home_page.dart';
import 'package:toko_buah/utils/color_util.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [
      MainHomePage(),
      ExploreMainPage(),
      ChartMainPage(),
      MainPageFavorite(),
      MainPageAccount(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: onActiveNav,
        inactiveColorPrimary: offActiveNav,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.explore),
        title: ("Explore"),
        activeColorPrimary: onActiveNav,
        inactiveColorPrimary: offActiveNav,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: ("Chart"),
        activeColorPrimary: onActiveNav,
        inactiveColorPrimary: offActiveNav,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("Favorite"),
        activeColorPrimary: onActiveNav,
        inactiveColorPrimary: offActiveNav,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        title: ("Account"),
        activeColorPrimary: onActiveNav,
        inactiveColorPrimary: offActiveNav,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        padding: const EdgeInsets.only(top: 10, bottom: 8),
        backgroundColor: mainCoolor,
        isVisible: true,
        decoration: NavBarDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          colorBehindNavBar:
              mainCoolor, // opsional, untuk pastikan tidak tumpang tindih
        ),
        animationSettings: const NavBarAnimationSettings(
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: 63,
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property
      ),
    );
  }
}
