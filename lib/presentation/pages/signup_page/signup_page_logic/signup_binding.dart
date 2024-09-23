import 'package:get/get.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page_logic/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthRemoteDataSource(api: Get.find<DioConsumer>()));
    // Get.lazyPut(() => AuthRepositoryImpl());
    // Get.lazyPut(() => Register(repository: Get.find<AuthRepositoryImpl>()));
    Get.put(SignupController(), permanent: true);
  }
}
