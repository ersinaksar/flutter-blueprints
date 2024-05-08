import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'src/app_module.dart';
import 'src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully.");
    runApp(ModularApp(module: AppModule(), child: AppWidget()));
  } catch (e) {
    print("Firebase initialization failed: $e");
  }
}
