import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
  final RxBool errorPhonenumber = false.obs;
  final RxBool errorName = false.obs;
  final RxBool errorPassword = false.obs;
  RxInt cnt = 0.obs;

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
