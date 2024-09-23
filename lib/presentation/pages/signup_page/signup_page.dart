import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:medical_test/presentation/custom_widgets/app_icon_wigdet.dart';
import 'package:medical_test/presentation/custom_widgets/my_clipper.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page_widgets/signup_page_widgets.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorManager.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: SizedBox(
                    height: AppSizeScreen.screenHeight * 0.31,
                    child: Image.asset(
                      AssetsManager.backgroundSignUImage,
                      width: AppSizeScreen.screenWidth * 1,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSizeScreen.screenWidth,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSignUpPage(),
                      InputSignUpPage(),
                      ChooseType(),
                      AlreadyHaveAccontSignUp(),
                      ButtonSignUpPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
