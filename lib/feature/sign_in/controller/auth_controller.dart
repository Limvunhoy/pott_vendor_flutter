import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/service/auth/auth_service.dart';
import 'package:pott_vendor/utils/export.dart';
import 'package:pott_vendor/utils/helper/user_manager.dart';

class AuthController extends GetxController {
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService _authService = AuthService();
  CountryCode countryCode = CountryCode();

  UserDataResponse? auth;

  UserManager userManager = UserManager();

  bool isAuthentication = false;

  @override
  void onInit() {
    getCurrentUser();
    print("Is User Logged In $isAuthentication");
    super.onInit();
  }

  getCurrentUser() async {
    var currentUser = await userManager.readUser();
    if (currentUser != null) {
      isAuthentication = true;
    } else {
      isAuthentication = false;
    }
    update();
  }

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

  onUpdateCountryCode(CountryCode code) {
    countryCode = code;
    update();
  }

  login() async {
    try {
      String phone = getPhoneNumber(countryCode, phoneNumberController.text);
      String password = passwordController.text;

      final response = await _authService.login(phone, password);

      auth = response.data;
      userManager.setAuth = response.data;
      userManager.saveUser();
      update();
      print("User Logged In");
    } catch (e) {
      if (e is ErrorResponse) {
        Fluttertoast.showToast(msg: e.message.description);
      }
    }
  }
}

extension on AuthController {
  String getPhoneNumber(CountryCode code, String phone) {
    return code.toString() + "${int.parse(phone)}";
  }
}
