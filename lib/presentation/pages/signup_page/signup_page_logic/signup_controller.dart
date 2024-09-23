import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxInt selectedRole = 0.obs;
  // final Register _register;
  final isSignUp = false.obs;
  final isLoading = false.obs;
  // SignupController(this._register);
  // signUpWith() async {
  //   isLoading.value = true;
  //   try {
  //     final respons = await _register.call(
  //         params: SignUpParams(
  //             fullName: nameController.text,
  //             email: emailController.text,
  //             password: passwordController.text,
  //             passwordConfirmation: confirmPasswordController.text));
  //     isSignUp.value = true;
  //     isLoading.value = false;
  //     respons.fold((error) {
  //       print(error.errMessage);
  //       print(error.toString());
  //     }, (success) {
  //       print(success.massage);
  //       Get.off(() => EmailVerificationPage(email: emailController.text));
  //     });
  //   } catch (e) {
  //     isLoading.value = false;
  //     print(e.toString());
  //   }
  // }
}
