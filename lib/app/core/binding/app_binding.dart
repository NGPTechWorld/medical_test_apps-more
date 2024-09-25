import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:medical_test/app/services/local_storage/cache_service_getstorage.dart';
import '/app/services/api/dio_consumer.dart';
import '/app/services/connection/network_info.dart';
import '../../services/local_storage/cache_services_with_sharedpreferences.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CacheServicesSharedPreferences()).init();
    Get.put(CacheServiceGetStorage());
    Get.lazyPut(() => DioConsumer());
    Get.put(NetworkInfoImpl());
    //repos
    //  lazyPut TempRepositoryImpl
    //  lazyPut TempLocalDataSourcee
    //  lazyPut TempRemoteDataSource +Get.find<DioConsumer>()
  }

  Future<void> initializes() async {
    await Get.find<CacheServicesSharedPreferences>().init();
  }
}
