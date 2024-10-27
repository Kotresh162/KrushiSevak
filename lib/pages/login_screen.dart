import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'register_screen.dart'; // Import the RegisterScreen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
                hintText: 'Enter your mobile number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // Handle login action
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the registration page using GetX
                Get.to(() => RegisterScreen());
              },
              child: const Text('New user? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
