import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_test/presentation/custom_widgets/bottun_custom.dart';
import 'package:medical_test/presentation/custom_widgets/text_field_custom.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page_logic/signup_controller.dart';

class TitleSignUpPage extends StatelessWidget {
  const TitleSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: Text(
          StringManager.texts["signup"]![StringManager.local],
          style: StyleManager.h1_Bold(color: ColorManager.firstDarkColor),
        ),
      ),
    );
  }
}

class InputSignUpPage extends GetView<SignupController> {
  const InputSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCustom(
          title: StringManager.texts["name"]![StringManager.local],
          controller: controller.nameController,
        ),
        TextFieldCustom(
          title: StringManager.texts["numberPhone"]![StringManager.local],
          controller: controller.numberPhoneController,
        ),
        TextFieldCustom(
          title: StringManager.texts["password"]![StringManager.local],
          controller: controller.passwordController,
        ),
        TextFieldCustom(
          title: StringManager.texts["confirmPassword"]![StringManager.local],
          controller: controller.confirmPasswordController,
        ),
      ],
    );
  }
}

class AlreadyHaveAccontSignUp extends StatelessWidget {
  const AlreadyHaveAccontSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        children: [
          Text(
            StringManager.texts["alreadyHaveAccount"]![StringManager.local],
            style:
                StyleManager.body01_Medium(color: ColorManager.primary6Color),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: Text(
              StringManager.texts["login"]![StringManager.local],
              style:
                  StyleManager.body01_Semibold(color: ColorManager.firstColor),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSignUpPage extends GetView<SignupController> {
  const ButtonSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SignupController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
        child: Center(
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: ColorManager.firstDarkColor,
                )
              : BottouCustom(
                  text: StringManager.texts["signup"]![StringManager.local],
                  function: () {
                    controller.signUpWith();
                  },
                  background: ColorManager.firstColor,
                ),
        ),
      ),
    );
  }
}

class ChooseType extends GetView<SignupController> {
  const ChooseType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SignupController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Text(
                StringManager.texts["typeAccount"]![StringManager.local],
                style: StyleManager.h3_Bold(color: ColorManager.firstDarkColor),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      StringManager.texts["patient"]![StringManager.local],
                      style: StyleManager.body01_Medium(
                          color: ColorManager.primary7Color),
                    ),
                    leading: Radio<int>(
                      fillColor:
                          const WidgetStatePropertyAll(ColorManager.firstColor),
                      value: 1,
                      groupValue: controller.selectedRole.value,
                      onChanged: (int? value) {
                        controller.selectedRole.value = value!;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      StringManager.texts["nurse"]![StringManager.local],
                      style: StyleManager.body01_Medium(
                          color: ColorManager.primary7Color),
                    ),
                    leading: Radio<int>(
                      fillColor:
                          const WidgetStatePropertyAll(ColorManager.firstColor),
                      value: 0,
                      groupValue: controller.selectedRole.value,
                      onChanged: (int? value) {
                        controller.selectedRole.value = value!;
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
