import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:krushisevak/pages/login_screen.dart';

class RegistrationController extends GetxController {
  var mobileNumber = ''.obs;
  var password = ''.obs;
  var userRole = ''.obs; // Variable for storing user role

  Future<void> register() async {
    // Handle registration logic
    if (mobileNumber.value.isNotEmpty &&
        password.value.isNotEmpty &&
        userRole.value.isNotEmpty) {
      await FirebaseFirestore.instance.collection('Users').add({
        'name': password.value,
        'mobileNumber': mobileNumber.value,
        'userRole': userRole.value,
      });
      Get.to(LoginScreen());
      // Proceed with registration logic
      Get.snackbar(
          'Success', 'Account created successfully as ${userRole.value}');
    } else {
      Get.snackbar('Error', 'Provide details Properly');
    }
  }
}
