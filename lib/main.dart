import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:krushisevak/contoller/home_controller.dart';
import 'package:krushisevak/pages/homa_screen.dart';
import 'package:get/get.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomaScreen(),
    );
  }
}
