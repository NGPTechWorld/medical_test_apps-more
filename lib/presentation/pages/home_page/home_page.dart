import 'package:flutter/material.dart';
import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/presentation/pages/home_page/home_page_widgets/curved_navigation_bar/curved_navigation_bar_custom.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AssetsManager.iconeAppImage),
        backgroundColor: ColorManager.whiteColor,
        title: Text(
          StringManager.titleApp.tr,
          style: StyleManager.h2_Bold(color: ColorManager.secoundDarkColor),
        ),
      ),
      backgroundColor: ColorManager.whiteColor,
      body: const CurvedNavigationBarCustom(),
    );
  }
}
