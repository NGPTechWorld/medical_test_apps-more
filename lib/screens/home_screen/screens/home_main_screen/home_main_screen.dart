import 'package:flutter/material.dart';
import 'package:medical_test/lib/core/utils/color_manager.dart';
import 'package:medical_test/lib/core/utils/values_manager.dart';
import 'package:medical_test/screens/home_screen/screens/home_main_screen/widget/specialization_carousel.dart';

class HomeMainScreen extends StatelessWidget {
  HomeMainScreen({super.key});
  final s = ["mohamd", "dddd"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: SizedBox(
                height: AppSizeScreen.screenHeight * 0.5,
                child: const SpecializationCarousel()),
          ),
        ],
      ),
    );
  }
}
