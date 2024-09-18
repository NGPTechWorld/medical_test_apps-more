import 'package:flutter/material.dart';
import '/app/app.dart';
import '/app/core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  await AppBinding().initializes();
  runApp(const App());
}
