import 'package:flutter/material.dart';
import 'package:medical_test/screens/home_screen/screens/home_main_screen/widget/specialization_carousel.dart';
import 'package:medical_test/screens/utils/color_manager.dart';
import 'package:medical_test/screens/utils/values_manager.dart';
import 'package:medical_test/screens/home_screen/screens/home_main_screen/widget/specialization_carousel%20copy.dart';
import 'package:medical_test/screens/home_screen/screens/home_main_screen/widget/top_doctor_list.dart';

class HomeMainScreen extends StatelessWidget {
  HomeMainScreen({super.key});
  final s = ["mohamd", "dddd"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: const SpecializationCarousel(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: SizedBox(
                  height: AppSizeScreen.screenHeight * 0.5,
                  child: const TopDoctorList()),
            ),
          ],
        ),
      ),
    );
  }
}
