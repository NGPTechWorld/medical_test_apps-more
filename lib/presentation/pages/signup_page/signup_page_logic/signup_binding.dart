import 'package:get/get.dart';
import 'package:medical_test/app/services/api/dio_consumer.dart';
import 'package:medical_test/data/datasources/auth_datasources/auth_local_datasource.dart';
import 'package:medical_test/data/datasources/auth_datasources/auth_remot_datasource.dart';
import 'package:medical_test/domain/repositories/auth_repositories.dart';
import 'package:medical_test/domain/usecases/auth_usecase/signup_usecase.dart';
import 'package:medical_test/presentation/pages/signup_page/signup_page_logic/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRemoteDataSource(api: Get.find<DioConsumer>()));
    Get.lazyPut(() => AuthLocalDataSource());
    Get.lazyPut(() => AuthRepositoryImpl());
    Get.lazyPut(
        () => SignupUsecase(repository: Get.find<AuthRepositoryImpl>()));
    Get.put(SignupController(Get.find()), permanent: true);
  }
}
