import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_test/lib/core/utils/assets_manager.dart';
import 'package:medical_test/lib/core/utils/color_manager.dart';
import 'package:medical_test/lib/core/utils/values_manager.dart';
import 'package:medical_test/screens/home_screen/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.iconeAppImage,
            height: AppSizeScreen.screenHeight / 4,
            width: double.infinity,
          ),
          SizedBox(
            height: AppSizeScreen.screenHeight / 8,
          ),
          const CircularProgressIndicator(
            color: ColorManager.secoundDarkColor,
          )
        ],
      ),
    );
  }
}
