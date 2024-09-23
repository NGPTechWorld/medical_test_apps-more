import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:flutter/material.dart';

class BottouCustom extends StatelessWidget {
  final Function function;
  final Color background;
  final String text;
  const BottouCustom(
      {super.key,
      required this.function,
      required this.text,
      required this.background});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () => function(),
        child: Container(
          height: AppSizeScreen.screenHeight * 0.07,
          width: AppSizeScreen.screenWidth / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              text,
              style: StyleManager.h3_Bold(color: ColorManager.whiteColor),
            )),
          ),
        ));
  }
}
