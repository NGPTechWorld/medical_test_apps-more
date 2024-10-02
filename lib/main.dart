import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/firebase_options.dart';
import '/app/app.dart';
import '/app/core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  await AppBinding().initializes();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  PushNotification.initialise();
  // AuthRepositoryImpl().signUp("mohamad", "dd", "ddd", "dddd");
  // debugPrint(
  //     await CacheServicesSharedPreferences().getDataString(key: "tokenUser"));
  runApp(const App());
}
