import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krushisevak/contoller/register_controller.dart';
import 'package:krushisevak/pages/login_screen.dart';


class RegisterScreen extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  RegisterScreen({super.key});

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
              'Create an Account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                controller.mobileNumber.value = value;
              },
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
                hintText: 'Enter your mobile number',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              onChanged: (value) {
                controller.password.value = value;
              },
              decoration: InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(),
                hintText: 'password',
              ),
            ),
            SizedBox(height: 20),
            // User role selection via ToggleButtons
            Text('Select User Role:', style: TextStyle(fontSize: 16)),
            Obx(() => ToggleButtons(
                  isSelected: [
                    controller.userRole.value == 'Admin',
                    controller.userRole.value == 'Client',
                  ],
                  onPressed: (index) {
                    if (index == 0) {
                      controller.userRole.value = 'Admin';
                    } else {
                      controller.userRole.value = 'Client';
                    }
                  },
                  color: Colors.black,
                  selectedColor: Colors.white,
                  fillColor: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                  children: const[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Admin'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Client'),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                controller.register(); // Use the controller to handle registration
              },
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () {
                Get.to(LoginScreen()); // Go back to the previous screen
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
