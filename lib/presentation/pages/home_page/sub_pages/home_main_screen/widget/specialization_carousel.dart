import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:medical_test/data/enums/medical_pecialization_enume.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpecializationCarousel extends StatefulWidget {
  const SpecializationCarousel({super.key});

  @override
  _SpecializationCarouselState createState() => _SpecializationCarouselState();
}

class _SpecializationCarouselState extends State<SpecializationCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<MedicalSpecialization>> specializationChunks =
        MedicalSpecializationController.chunkSpecializations(4);

    return Container(
      color: ColorManager.whiteColor,
      child: Column(
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
          Align(
            alignment: Alignment.topCenter,
            child: CarouselSlider.builder(
              itemCount: specializationChunks.length,
              itemBuilder: (context, index, realIndex) {
                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  children: specializationChunks[index].map((specialization) {
                    return Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primary1Color,
                          boxShadow: const [BoxShadow(blurRadius: AppSize.s2)],
                          border: Border.all(
                              color: ColorManager.firstColor,
                              width: AppSize.s2),
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
                                          specialization),
                                  style: StyleManager.body01_Semibold(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              options: CarouselOptions(
                height: AppSizeScreen.screenHeight * 0.35,
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
      ),
    );
  }
}
