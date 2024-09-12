import 'package:flutter/material.dart';
import 'package:medical_test/lib/core/utils/color_manager.dart';
import 'package:medical_test/screens/home_screen/screens/favorite_main_screen/favorite_main_screen.dart';
import 'package:medical_test/screens/home_screen/screens/home_main_screen/home_main_screen.dart';
import 'package:medical_test/screens/home_screen/screens/profile_main_screen/profile_main_screen.dart';
import 'package:medical_test/screens/home_screen/widgets/curved_navigation_bar/bottom_navication_bar_model.dart';

class CurvedNavigationBarCustom extends StatefulWidget {
  const CurvedNavigationBarCustom({super.key});
  @override
  State<CurvedNavigationBarCustom> createState() =>
      _CurvedNavigationBarCustomState();
}

class _CurvedNavigationBarCustomState extends State<CurvedNavigationBarCustom> {
  int indexPage = 0;
  List<Widget> _pages = [
    HomeMainScreen(),
    const FavoriteMainScreen(),
    const ProfileMainScreen(),
  ];
  void setIndex(int index) {
    setState(() {
      indexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: indexPage,
            children: _pages,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CurvedNavigationBarCustomModel(
                  color: ColorManager.firstDarkColor,
                  backgroundColor: ColorManager.transparentColor,
                  buttonBackgroundColor: ColorManager.secoundDarkColor,
                  onTap: (value) {
                    _pages = [
                      HomeMainScreen(),
                      const FavoriteMainScreen(),
                      const ProfileMainScreen(),
                    ];
                    setState(() {
                      indexPage = value;
                    });
                  },
                  index: indexPage,
                  items: const [
                    Icon(
                      Icons.home,
                      color: ColorManager.whiteColor,
                    ),
                    Icon(
                      Icons.favorite,
                      color: ColorManager.whiteColor,
                    ),
                    Icon(
                      Icons.person,
                      color: ColorManager.whiteColor,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
