import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? phoneNumberValidate(String? phone) {
    if (phone!.isEmpty || phone == "") {
      return "Please enter your phone number";
    } else {
      return null;
    }
  }

  String? passwordValidate(String? phone) {
    if (phone!.isEmpty || phone == "") {
      return "Please enter your password";
    } else {
      return null;
    }
  }

  void onLogIn() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Validate Success", "User Logged In");
    }
  }
}
