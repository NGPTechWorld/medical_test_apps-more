class StringManager {
  static int local = 0;
  static Map<String, List<String>> texts = {
    //Home
    "titleApp": ["المركز الطبي", "T"],
    "sectionsText": ["الأقسام الطبية", "Sections"],
    "topDocktorText": ["أفضل الأطباء", "Top Doctors"],
    //Sign Up
    "signup": ["حساب جديد", "Sign Up"],
    "alreadyHaveAccount": ["لدي حساب في المركز", "Already have account"],
    "name": ["الاسم", "Name"],
    "numberPhone": ["رقم الموبايل", "Number Phone"],
    "password": ["كلمة المرور", "Password"],
    "confirmPassword": ["تأكيد كلمة المرور", "Password Confirm"],
    "typeAccount": ["نوع الحساب", "Type Account"],
    "login": ["تسجيل الدخول", "Login"],
    "patient": ["مريض", "Patient"],
    "nurse": ["ممرض", "Nurse"],
    "ERROR_isEmpty": ["هذا الحقل فارغ", "This field is empty"],
    "ERROR_NumberPhone": ["رقم الهاتف غير صحيح", "The phone number is invalid"],
    "ERROR_PasswordMin": [
      "يجب ان تكون أكثر من 6 خانات",
      "At least 6 characters"
    ],
    "ERROR_PasswordPatern": [
      "يجب ان تحوي أحرف كبيرة وصغيرة وأرقام",
      "At least one number and special character"
    ],
  };
  // error handler
  static const String strBadRequestError = "BadRequest Error";
  static const String strNoContent = "No Content";
  static const String strForbiddenError = "Forbidden Error";
  static const String strUnauthorizedError = "Unauthorized Error";
  static const String strNotFoundError = "Not Found Error";
  static const String strConflictError = "Conflict Error";
  static const String strInternalServerError = "Internal server Error";
  static const String strUnknownError = "Unknown Error";
  static const String strTimeoutError = "Timeout Error";
  static const String strDefaultError =
      "Something went wrong, please try again";
  static const String strCacheError = "Cache Error";
  static const String strNoInternetError =
      "No Connection, please check your internet connection and try again";
  static const nointernet = "No Internet!";
  static const String success = "success";
}
