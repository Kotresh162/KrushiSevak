import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:krushisevak/contoller/admin_controller/home_controller.dart';
import 'package:krushisevak/pages/admin_screen/homa_screen.dart';
import 'package:krushisevak/pages/client/client_home_screen.dart';
import 'package:krushisevak/pages/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Flutter bindings are initialized
  await GetStorage.init();
  Get.put(HomeController()); // Initialize GetStorage
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Title',
      home: checkLogin(), // Check if user is already logged in
    );
  }

  Widget checkLogin() {
    final box = GetStorage();
    final isLoggedIn = box.read('isLoggedIn') ?? false; // Check login status

    if (isLoggedIn) {
      final userRole = box.read('userRole'); // Get the user role from storage
      if (userRole == 'Admin') {
        return HomaScreen(); // Navigate to Admin's home page
      } else {
        return ClientHomeScreen(); // Navigate to Client's home page
      }
    } else {
      return LoginScreen(); // Otherwise, show the Login Screen
    }
  }
}
