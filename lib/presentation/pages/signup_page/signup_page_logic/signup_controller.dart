import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_test/app/core/params/params.dart';
import 'package:medical_test/app/services/local_storage/cache_services.dart';
import 'package:medical_test/domain/usecases/auth_usecase/signup_usecase.dart';
import 'package:medical_test/presentation/pages/home_page/home_page.dart';
import 'package:medical_test/presentation/pages/home_page/sub_pages/home_main_screen/home_main_screen.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxInt selectedRole = 0.obs;
  final SignupUsecase _register;
  final isSignUp = false.obs;
  final isLoading = false.obs;
  final CacheServices cache = Get.find();
  SignupController(this._register);

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
