import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_test/app/services/local_storage/cache_services_with_sharedpreferences.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var submittedOnce = false.obs;
  final numberPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final isSignUp = false.obs;
  final isLoading = false.obs;
  final isVisablePass = true.obs;
  final isVisablePassConf = true.obs;

  final cache = Get.find<CacheServicesSharedPreferences>();
  LoginController();

  //TextField
  final RxBool minimumLength = false.obs;
  final RxBool numberAndCharacter = false.obs;
  final RxBool avoidPassword = false.obs;
  final RxBool avoidNumberPhone = false.obs;
  final RxBool errorPhonenumber = false.obs;
  final RxBool errorPassword = false.obs;
  RxInt cnt = 0.obs;
}
