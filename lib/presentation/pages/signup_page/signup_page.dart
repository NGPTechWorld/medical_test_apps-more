import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:medical_test/presentation/custom_widgets/image_clippath.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page_logic/signup_controller.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page_widgets/signup_page_widgets.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorManager.primary1Color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ImageClippath(image: AssetsManager.backgroundSignUImage),
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
    );
  }
}
