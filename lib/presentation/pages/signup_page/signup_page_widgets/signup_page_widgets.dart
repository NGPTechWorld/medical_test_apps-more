import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/app/config/validator_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_test/presentation/custom_widgets/bottun_custom.dart';
import 'package:medical_test/presentation/custom_widgets/text_field_custom.dart';
import 'package:medical_test/presentation/pages/login_page/login_page.dart';
import 'package:medical_test/presentation/pages/login_page/login_page_logic/login_binding.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page_logic/signup_controller.dart';

class TitleSignUpPage extends StatelessWidget {
  const TitleSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: Text(
          StringManager.signup.tr,
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
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Obx(
            () => TextFieldCustom(
              title: StringManager.name.tr,
              controller: controller.nameController,
              autoValidateMode: controller.submittedOnce.value
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              validator: (value) {
                return ValidatorManager.vaildatorName(
                    controller.nameController.text, controller.errorName);
              },
            ),
          ),
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
          Obx(
            () => TextFieldCustom(
              title: StringManager.confirmPassword.tr,
              controller: controller.confirmPasswordController,
              isPassword: true,
              obscureText: controller.isVisablePassConf.value,
              onClick: () {
                controller.isVisablePassConf.value =
                    !controller.isVisablePassConf.value;
              },
            ),
          ),
        ],
      ),
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
            StringManager.alreadyHaveAccount.tr,
            style:
                StyleManager.body01_Medium(color: ColorManager.primary6Color),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: InkWell(
              onTap: () => Get.off(const LoginPage(), binding: LoginBinding()),
              child: Text(
                StringManager.login.tr,
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
                  text: StringManager.signup.tr,
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
                StringManager.typeAccount.tr,
                style: StyleManager.h3_Bold(color: ColorManager.firstDarkColor),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      StringManager.patient.tr,
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
                      StringManager.nurse.tr,
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
