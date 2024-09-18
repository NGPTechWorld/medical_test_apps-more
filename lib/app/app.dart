import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:medical_test/presentation/pages/start_page/start_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizeScreen.screenSize = MediaQuery.of(context).size;
    AppSizeScreen.screenHeight = AppSizeScreen.screenSize.height;
    AppSizeScreen.screenWidth = AppSizeScreen.screenSize.width;
    return const GetMaterialApp(
      home: StartScreen(),
    );
  }
}
