import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:krushisevak/pages/admin_screen/homa_screen.dart';
import 'package:krushisevak/pages/client/client_home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedRole = "Admin"; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
                hintText: 'Enter your mobile number',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 20),
            Text('Select User Role:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: selectedRole,
              items: <String>['Admin', 'Client'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                login(mobileNumberController.text, passwordController.text, selectedRole);
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => RegisterScreen());
              },
              child: const Text('New user? Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login(String mobileNumber, String password, String userRole) async {
  try {
    // Check Firebase initialization before accessing Firestore
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }

    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('mobileNumber', isEqualTo: mobileNumber)
        .where('name', isEqualTo: password) // Handle passwords securely
        .where('userRole', isEqualTo: userRole)
        .get();

    if (userSnapshot.docs.isNotEmpty) {
      Get.snackbar('Success', 'Logged in successfully as $userRole');
      final box = GetStorage();
      box.write('isLoggedIn', true);
      box.write('userRole', userRole);

      if (userRole == 'Admin') {
        Get.off(() => HomaScreen());
      } else if (userRole == 'Client') {
        Get.off(() => ClientHomeScreen());
      }
    } else {
      Get.snackbar('Error', 'Invalid credentials, please try again.');
    }
  } catch (e) {
    Get.snackbar('Error', 'An error occurred during login: $e');
  }
}

}
