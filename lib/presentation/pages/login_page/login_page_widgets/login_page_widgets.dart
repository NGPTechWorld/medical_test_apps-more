import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/app/config/validator_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_test/presentation/custom_widgets/bottun_custom.dart';
import 'package:medical_test/presentation/custom_widgets/text_field_custom.dart';
import 'package:medical_test/presentation/pages/login_page/login_page_logic/login_controller.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page.dart';

class TitleLoginPage extends StatelessWidget {
  const TitleLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: Text(
          StringManager.login.tr,
          style: StyleManager.h1_Bold(color: ColorManager.firstDarkColor),
        ),
      ),
    );
  }
}

class InputLoginPage extends GetView<LoginController> {
  const InputLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Obx(
            () => TextFieldCustom(
              title: StringManager.numberPhone.tr,
              controller: controller.numberPhoneController,
              isNumberPhone: true,
              autoValidateMode: controller.submittedOnce.value
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              validator: (value) {
                return ValidatorManager.vaildatorNumberPhone(
                    controller.numberPhoneController.text,
                    controller.errorPhonenumber,
                    controller.avoidNumberPhone);
              },
            ),
          ),
          Obx(
            () => TextFieldCustom(
              title: StringManager.password.tr,
              controller: controller.passwordController,
              isPassword: true,
              obscureText: controller.isVisablePass.value,
              onClick: () {
                controller.isVisablePass.value =
                    !controller.isVisablePass.value;
              },
              autoValidateMode: controller.submittedOnce.value
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              validator: (value) {
                return ValidatorManager.validatorPassword(
                    controller.passwordController.text,
                    controller.errorPassword,
                    controller.avoidPassword);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DontHaveAccontSignUp extends StatelessWidget {
  const DontHaveAccontSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        children: [
          Text(
            StringManager.dontHaveAccount.tr,
            style:
                StyleManager.body01_Medium(color: ColorManager.primary6Color),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: InkWell(
              onTap: () => Get.off(() => const SignupPage()),
              child: Text(
                StringManager.signup.tr,
                style: StyleManager.body01_Semibold(
                    color: ColorManager.firstColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonLoginPage extends GetView<LoginController> {
  const ButtonLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
        child: Center(
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: ColorManager.firstDarkColor,
                )
              : BottouCustom(
                  text: StringManager.login.tr,
                  function: () {
                    // controller.signUpWith();
                    if (controller.formKey.currentState!.validate()) {}
                  },
                  background: ColorManager.firstColor,
                ),
        ),
      ),
    );
  }
}
