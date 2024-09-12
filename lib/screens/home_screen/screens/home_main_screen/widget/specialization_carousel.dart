import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medical_test/lib/core/controllers/medical_specialization_controller.dart';
import 'package:medical_test/lib/core/utils/assets_manager.dart';
import 'package:medical_test/lib/core/utils/color_manager.dart';
import 'package:medical_test/lib/core/utils/enums/pecialization_enume.dart';
import 'package:medical_test/lib/core/utils/string_manager.dart';
import 'package:medical_test/lib/core/utils/style_manager.dart';
import 'package:medical_test/lib/core/utils/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// دالة لتقسيم قائمة التخصصات إلى أجزاء

class SpecializationCarousel extends StatefulWidget {
  const SpecializationCarousel({super.key});

  @override
  _SpecializationCarouselState createState() => _SpecializationCarouselState();
}

class _SpecializationCarouselState extends State<SpecializationCarousel> {
  int currentIndex = 0; // لتتبع الفهرس الحالي

  @override
  Widget build(BuildContext context) {
    // تقسيم التخصصات إلى مجموعات من 4
    List<List<MedicalSpecialization>> specializationChunks =
        MedicalSpecializationController.chunkSpecializations(4);

    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteColor,
        title: Text(
          StringManager.sectionsText,
          style: StyleManager.h3_Bold(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: specializationChunks.length,
              itemBuilder: (context, index, realIndex) {
                return GridView.count(
                  crossAxisCount: 2, // عدد الأعمدة
                  children: specializationChunks[index].map((specialization) {
                    return Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Container(
                        width: AppSizeScreen.screenWidth / 2,
                        height: AppSizeScreen.screenHeight / 5,
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
                height: AppSizeScreen.screenHeight * 0.5,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index; // تحديث الفهرس الحالي
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
            child: AnimatedSmoothIndicator(
              activeIndex: currentIndex, // الفهرس الحالي
              count: specializationChunks.length, // عدد الشرائح
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
