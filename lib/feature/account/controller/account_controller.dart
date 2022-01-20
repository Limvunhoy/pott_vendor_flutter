import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/core/model/account/updateUserBodyRequest.dart';
import 'package:pott_vendor/core/model/account/update_account_info_response.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/core/service/account/account_service.dart';
import 'package:pott_vendor/utils/constants/shared_preference_keys.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';
import 'package:pott_vendor/utils/helper/shared_preference_helper.dart';

class AccountController extends GetxController {
  File? profilePic;
  final ImagePicker _imagePicker = ImagePicker();

  AccountService _accountService = AccountService();

  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  UserDataResponse? user;
  UpdateAccountInfoResponse? updateAccountInfoResponse;
  String? profilePath;

  SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();

  FetchStatus fetchStatus = FetchStatus.idle;

  Future pickImage(ImageSource source) async {
    print("Image Picker Source $source");
    try {
      print("Source $source");
      final image = await _imagePicker.pickImage(
        source: source,
        // imageQuality: 50,
        // maxHeight: 500,
        // maxWidth: 500,
      );
      print("Image $image");
      if (image == null) return;
      profilePic = File(image.path);
      print("Image Path ${image.path}");

      // await uploadImage(profilePic!);
      // _accountService.uploadImageHttp(profilePic!);
      _accountService.uploadImage(File(image.path));
      // _accountService.getUploadImg(profilePic!);

      update();
      print("Profile Path ${profilePic!.path}");
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  updateAccountInfo() async {
    try {
      UpdateAccountBodyRequest updateAccountBodyRequest =
          UpdateAccountBodyRequest(
        firstname: firstNameTextController.text,
        lastname: lastNameTextController.text,
        email: emailTextController.text,
        phone: phoneNumberTextController.text,
        address: addressTextController.text,
        photo: "",
        cover: "",
      );

      print("Phone ${phoneNumberTextController.text.runtimeType}");
      // if (firstNameTextController.text.isNotEmpty) {
      //   updateAccountBodyRequest.firstname = firstNameTextController.text;
      // } else if (lastNameTextController.text.isNotEmpty) {
      //   updateAccountBodyRequest.lastname = lastNameTextController.text;
      // } else if (emailTextController.text.isNotEmpty) {
      //   updateAccountBodyRequest.email = emailTextController.text;
      // } else if (phone)
      fetchStatus = FetchStatus.loading;
      update();

      UserDataResponse currentUser = UserDataResponse.fromJson(
          await _sharedPreferenceHelper.read(SharedPreferenceKey.user));
      final res = await _accountService.updateAccountInfo(
          currentUser.vendorId, updateAccountBodyRequest);

      fetchStatus = FetchStatus.complete;
      update();

      print("Update User Account Info Successfully: ${res.data}");
    } catch (e) {
      print("Failed to Update User Account Info: $e");
    }
  }

  // uploadImage(File file) async {
  //   try {
  //     final res = await _accountService.uploadImage(file);
  //     print("Upload Image Response: ${res.results.path}");
  //     profilePath = res.results.path;
  //     update();
  //   } catch (e) {
  //     print("Something went wrong...! $e");
  //   }
  // }

  // updateAccountInfo() async {
  //   try {
  //
  //     UserDataResponse currentUser = UserDataResponse.fromJson(
  //         await _sharedPreferenceHelper.read(SharedPreferenceKey.user));
  //
  //     updateAccountInfoResponse = await _accountService.updateAccountInfo(currentUser.vendorId, )
  //
  //   } catch (e) {
  //     print("Failed to update account info $e");
  //   }
  // }

}
