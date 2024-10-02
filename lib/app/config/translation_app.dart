import 'package:get/get.dart';
import 'package:medical_test/app/config/string_manager.dart';

class TranslationApp implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          //Home
          StringManager.titleApp: "المركز الطبي",
          StringManager.sectionsText: "الأقسام الطبية",
          StringManager.topDocktorText: "أفضل الأطباء",
          //Sign Up
          StringManager.signup: "حساب جديد",
          StringManager.alreadyHaveAccount: "لدي حساب في المركز",
          StringManager.name: "الاسم",
          StringManager.numberPhone: "رقم الموبايل",
          StringManager.password: "كلمة المرور",
          StringManager.confirmPassword: "تأكيد كلمة المرور",
          StringManager.typeAccount: "نوع الحساب",
          StringManager.login: "تسجيل الدخول",
          StringManager.patient: "مريض",
          StringManager.nurse: "ممرض",
          //Login
          StringManager.dontHaveAccount: "ليس لديك حساب في المركز",
          StringManager.errorisEmpty: "هذا الحقل فارغ",
          StringManager.errorPhonenumberIsPaten: "رقم الهاتف غير صحيح",
          StringManager.errorPasswordIsMin: "يجب ان تكون أكثر من 6 خانات",
          StringManager.errorPasswordIsPatern:
              "يجب ان تحوي أحرف كبيرة وصغيرة وأرقام",
        },
        "en": {
          //Home
          StringManager.titleApp: "T",
          StringManager.sectionsText: "Sections",
          StringManager.topDocktorText: "Top Doctors",
          //Sign Up
          StringManager.signup: "Sign Up",
          StringManager.alreadyHaveAccount: "Already have account",
          StringManager.name: "Name",
          StringManager.numberPhone: "Number Phone",
          StringManager.password: "Password",
          StringManager.confirmPassword: "Password Confirm",
          StringManager.typeAccount: "Type Account",
          StringManager.login: "Login",
          StringManager.patient: "Patient",
          StringManager.nurse: "Nurse",
          //Login
          StringManager.dontHaveAccount: "Dont have account",
          StringManager.errorisEmpty: "This field is empty",
          StringManager.errorPhonenumberIsPaten: "The phone number is invalid",
          StringManager.errorPasswordIsMin: "At least 6 characters",
          StringManager.errorPasswordIsPatern:
              "At least one number and special character"
        },
      };
}
