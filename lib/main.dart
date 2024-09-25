import 'package:flutter/material.dart';
import 'package:medical_test/app/services/local_storage/cache_services.dart';
import '/app/app.dart';
import '/app/core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  await AppBinding().initializes();
  print(await CacheServices().getDataString(key: "tokenUser"));
  runApp(const App());
}
