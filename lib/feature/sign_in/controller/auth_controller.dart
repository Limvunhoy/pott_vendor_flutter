import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/service/auth/auth_service.dart';
import 'package:pott_vendor/utils/constants/shared_preference_keys.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';
import 'package:pott_vendor/utils/helper/shared_preference_helper.dart';

class AuthController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService _authService = AuthService();
  CountryCode countryCode = CountryCode();

  UserDataResponse? auth;

  final isAuthentication = false.obs;

  FetchStatus fetchStatus = FetchStatus.idle;

  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  Future<bool> readUser() async {
    try {
      UserDataResponse? currentUser = UserDataResponse.fromJson(
          await sharedPreferenceHelper.read(SharedPreferenceKey.user));

      auth = currentUser;
      isAuthentication.value = currentUser.token != "";

      update();
      return isAuthentication.value;
    } catch (e) {
      isAuthentication.value = false;
      print("Failed to Read User From Local Storage $e");
      return isAuthentication.value;
    }
  }

  bool isShowPassword = false;

  handleShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  String usernameFormat() {
    return "${auth?.firstName ?? "N/A"} ${auth?.lastName ?? "N/A"}";
  }

  String phoneNumberFormat() {
    return "${auth!.phone}";
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

  void onUpdateCountryCode(CountryCode code) {
    countryCode = code;
    update();
  }

  Future<bool> login() async {
    fetchStatus = FetchStatus.loading;
    update();
    try {
      String phone = getPhoneNumber(countryCode, phoneNumberController.text);
      String password = passwordController.text;

      final response = await _authService.login(phone, password);
      auth = response;
      saveUser(response);

      fetchStatus = FetchStatus.complete;
      update();

      resetTextField();
      return true;
    } catch (e) {
      fetchStatus = FetchStatus.complete;
      fetchStatus = FetchStatus.error;
      if (e is ErrorResponse) {
        Fluttertoast.showToast(msg: e.message.description);
      } else {
        Fluttertoast.showToast(msg: "$e");
      }
      update();
      return false;
    }
  }

  resetTextField() {
    phoneNumberController.clear();
    passwordController.clear();
  }

  saveUser(UserDataResponse _auth) async {
    try {
      sharedPreferenceHelper.save(SharedPreferenceKey.user, _auth);
    } catch (e) {
      print("Failed to save user");
    }
  }

  updateAuth(UserDataResponse userDataResponse) {
    auth = userDataResponse;
    update();
  }

  Future<bool> handleLogout() async {
    try {
      await sharedPreferenceHelper.remove(SharedPreferenceKey.user);
      return true;
    } catch (e) {
      print("Failed to Logout $e");
      return false;
    }
  }
}

extension on AuthController {
  String getPhoneNumber(CountryCode code, String phone) {
    if (code.name == null) {
      return "+855${int.parse(phone)}";
    } else {
      return code.toString() + "${int.parse(phone)}";
    }
  }
}
