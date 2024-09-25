import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_test/app/services/api/api_response_model.dart';
import 'package:medical_test/app/services/api/dio_consumer.dart';
import 'package:medical_test/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:medical_test/domain/repositories/auth_repositories.dart';
import '/app/app.dart';
import '/app/core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  await AppBinding().initializes();
  // AuthRepositoryImpl().signUp("mohamad", "dd", "ddd", "dddd");
  debugPrint(
      await CacheServicesSharedPreferences().getDataString(key: "tokenUser"));
  runApp(const App());
}
