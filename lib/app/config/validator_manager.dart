import 'package:get/get.dart';
import 'package:medical_test/app/config/string_manager.dart';

class ValidatorManager {
  static String? vaildatorName(String text, RxBool error) {
    //final pattern = RegExp(r'^[a-zA-Z]([._ ]?[a-zA-Z]+){2,15}$');
    if (text.isEmpty) {
      Future.delayed(Duration.zero, () {
        error.value = true;
      });
      return StringManager.errorisEmpty.tr;
    }
    return null;
  }

  static String? vaildatorNumberPhone(
      String text, RxBool error, RxBool avoidNumberPhone) {
    avoidNumberPhone.value = text.length == 10;
    if (text.isEmpty) {
      Future.delayed(Duration.zero, () {
        error.value = true;
      });
      return StringManager.errorisEmpty.tr;
    } else if (!avoidNumberPhone.value) {
      Future.delayed(Duration.zero, () {
        error.value = true;
      });
      return StringManager.errorPhonenumberIsPaten;
    }
    return null;
  }

  static String? validatorPassword(
      String text, RxBool error, RxBool avoidPassword) {
    final pattern = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).*$');
    avoidPassword.value = text.length >= 6;
    bool numberAndCharacter = pattern.hasMatch(text);
    if (text.isEmpty) {
      Future.delayed(Duration.zero, () {
        error.value = true;
      });
      return StringManager.errorisEmpty.tr;
    } else if (!avoidPassword.value) {
      Future.delayed(Duration.zero, () {
        error.value = true;
      });
      return StringManager.errorPasswordIsMin.tr;
    } else if (!numberAndCharacter) {
      Future.delayed(Duration.zero, () {
        error.value = true;
      });
      return StringManager.errorPasswordIsPatern.tr;
    } else {
      Future.delayed(Duration.zero, () {
        error.value = false;
      });
      return null;
    }
  }
}
