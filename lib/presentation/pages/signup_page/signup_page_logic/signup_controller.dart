import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/core/params/params.dart';
import 'package:medical_test/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:medical_test/domain/usecases/auth_usecase/signup_usecase.dart';
import 'package:medical_test/presentation/pages/home_page/home_page.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var submittedOnce = false.obs;
  final nameController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxInt selectedRole = 1.obs;
  final SignupUsecase _register;
  final isSignUp = false.obs;
  final isLoading = false.obs;
  final isVisablePass = true.obs;
  final isVisablePassConf = true.obs;

  final cache = Get.find<CacheServicesSharedPreferences>();
  SignupController(this._register);

  //TextField
  final RxBool minimumLength = false.obs;
  final RxBool numberAndCharacter = false.obs;
  final RxBool avoidPassword = false.obs;
  final RxBool avoidNumberPhone = false.obs;
  final RxBool errorEmail = false.obs;
  final RxBool errorPassword = false.obs;
  RxInt cnt = 0.obs;

  String? vaildatorName() {
    final pattern = RegExp(r'^[a-zA-Z]([._ ]?[a-zA-Z]+){2,15}$');

    if (nameController.text.isEmpty) {
      Future.delayed(Duration.zero, () {
        errorPassword.value = true;
      });
      return StringManager.texts["ERROR_isEmpty"]![StringManager.local];
    }
    return null;
  }

  String? vaildatorNumberPhone() {
    avoidNumberPhone.value = numberPhoneController.text.length == 10;
    if (numberPhoneController.text.isEmpty) {
      Future.delayed(Duration.zero, () {
        errorPassword.value = true;
      });
      return StringManager.texts["ERROR_isEmpty"]![StringManager.local];
    } else if (!avoidNumberPhone.value) {
      Future.delayed(Duration.zero, () {
        errorPassword.value = true;
      });
      return StringManager.texts["ERROR_NumberPhone"]![StringManager.local];
    }
    return null;
  }

  String? validatorPassword() {
    final pattern = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).*$');
    avoidPassword.value = passwordController.text.length >= 6;
    numberAndCharacter.value = pattern.hasMatch(passwordController.text);
    if (passwordController.text.isEmpty) {
      Future.delayed(Duration.zero, () {
        errorPassword.value = true;
      });
      return StringManager.texts["ERROR_isEmpty"]![StringManager.local];
    } else if (!avoidPassword.value) {
      Future.delayed(Duration.zero, () {
        errorPassword.value = true;
      });
      return StringManager.texts["ERROR_PasswordMin"]![StringManager.local];
    } else if (!numberAndCharacter.value) {
      Future.delayed(Duration.zero, () {
        errorPassword.value = true;
      });
      return StringManager.texts["ERROR_PasswordPatern"]![StringManager.local];
    } else {
      Future.delayed(Duration.zero, () {
        errorPassword.value = false;
      });
      return null;
    }
  }

  signUpWith() async {
    isLoading.value = true;
    try {
      final respons = await _register.call(
          params: SignUpParams(
        name: nameController.text,
        numberPhone: numberPhoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        type: selectedRole.string,
      ));
      isSignUp.value = true;
      isLoading.value = false;
      respons.fold((error) {}, (success) {
        Get.off(() => const HomeScreen());
      });
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
