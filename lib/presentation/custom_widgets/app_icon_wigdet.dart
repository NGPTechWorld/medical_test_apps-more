import 'package:flutter/material.dart';
import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:get/get.dart';
import 'package:medical_test/app/config/values_manager.dart';

class AppIconWigdet extends StatelessWidget {
  const AppIconWigdet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p4),
          child: Text(
            StringManager.titleApp.tr,
            style: StyleManager.h2_Bold(color: ColorManager.firstDarkColor),
          ),
        ),
        Image.asset(
          AssetsManager.iconeAppImage,
          width: AppSizeScreen.screenWidth * 0.4,
          height: AppSizeScreen.screenHeight * 0.2,
        ),
      ],
    );
  }
}
