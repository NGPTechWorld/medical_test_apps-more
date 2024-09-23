import 'package:get/get.dart';
import 'package:medical_test/app/core/errors/expentions.dart';
import 'package:medical_test/app/services/local_storage/cache_services.dart';

class AuthLocalDataSource {
  final CacheServices cache = Get.find();
  final String key = "tokenUser";
  AuthLocalDataSource();

  cacheToken(String? tokenToCache) {
    if (tokenToCache != null) {
      cache.saveData(key: key, value: tokenToCache);
      print("====== done Save ======================\n" + tokenToCache);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
