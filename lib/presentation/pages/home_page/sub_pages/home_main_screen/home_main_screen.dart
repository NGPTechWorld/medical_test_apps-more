import 'package:flutter/material.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:medical_test/presentation/pages/home_page/sub_pages/home_main_screen/widget/specialization_carousel.dart';

class HomeMainScreen extends StatelessWidget {
  HomeMainScreen({super.key});
  final s = ["mohamd", "dddd"];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: SpecializationCarousel(),
            ),
          ],
        ),
      ),
    );
  }
}
