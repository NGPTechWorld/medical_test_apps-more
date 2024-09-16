import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medical_test/core/controllers/medical_specialization_controller.dart';
import 'package:medical_test/data/enums/medical_/medical_pecialization_enume.dart';
import 'package:medical_test/screens/utils/assets_manager.dart';
import 'package:medical_test/screens/utils/color_manager.dart';
import 'package:medical_test/screens/utils/string_manager.dart';
import 'package:medical_test/screens/utils/style_manager.dart';
import 'package:medical_test/screens/utils/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpecializationCarousel2 extends StatefulWidget {
  const SpecializationCarousel2({super.key});

  @override
  _SpecializationCarousel2State createState() =>
      _SpecializationCarousel2State();
}

class _SpecializationCarousel2State extends State<SpecializationCarousel2> {
  int currentIndex = 0;
  List<MedicalSpecialization> specialization = MedicalSpecialization.values;
  @override
  Widget build(BuildContext context) {
    List<List<MedicalSpecialization>> specializationChunks =
        MedicalSpecializationController.chunkSpecializations(4);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Text(
            StringManager.sectionsText,
            style: StyleManager.h3_Bold(),
          ),
        ),
        CarouselSlider.builder(
          itemCount: specializationChunks.length,
          itemBuilder: (context, index, realIndex) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: AppPadding.p10,
                crossAxisSpacing: AppPadding.p10,
              ),
              itemCount:
                  specialization.length > index ? 4 : specialization.length % 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorManager.primary1Color,
                    boxShadow: const [BoxShadow(blurRadius: AppSize.s2)],
                    border: Border.all(
                        color: ColorManager.firstColor, width: AppSize.s2),
                    borderRadius: BorderRadius.circular(AppSize.s14),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsManager.cardiologyImage,
                          height: AppSizeScreen.screenHeight / 12,
                          width: AppSizeScreen.screenWidth / 12,
                          color: ColorManager.firstColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p2),
                          child: Text(
                            MedicalSpecializationController
                                .getSpecializationNameInArabic(
                                    specialization[index]),
                            style: StyleManager.body01_Semibold(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: specializationChunks.length,
            effect: const ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: ColorManager.secoundColor,
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
