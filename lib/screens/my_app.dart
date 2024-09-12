import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_test/lib/core/utils/values_manager.dart';
import 'package:medical_test/screens/start_screen/start_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizeScreen.screenSize = MediaQuery.of(context).size;
    AppSizeScreen.screenHeight = AppSizeScreen.screenSize.height;
    AppSizeScreen.screenWidth = AppSizeScreen.screenSize.width;
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
