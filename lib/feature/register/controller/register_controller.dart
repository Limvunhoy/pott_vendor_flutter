import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int agreeTermsAndConditionsValue = 1;

  String? passwordValidate(String? password) {
    if (password!.isEmpty) {
      return "Please enter your password.";
    } else {
      return null;
    }
  }

  String? firstnameValidate(String? firstname) {
    if (firstname!.isEmpty) {
      return "Please enter your first name.";
    } else {
      return null;
    }
  }

  String? lastnameValidate(String? lastname) {
    if (lastname!.isEmpty) {
      return "Please enter your last name.";
    } else {
      return null;
    }
  }

  String? phoneNumberValidate(String? phone) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);

    if (phone!.isEmpty) {
      return "Please enter your phone number.";
    } else if (phone.length > 9 || !regExp.hasMatch(phone)) {
      return "Please enter valid phone number.";
    } else {
      return null;
    }
  }

  String? emailValidate(String? email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (email!.isEmpty) {
      return "Please enter your email.";
    } else if (!regExp.hasMatch(email)) {
      return "Please enter valid email.";
    } else {
      return null;
    }
  }

  handleRegister() {
    // TODO: Handle Register
  }

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
