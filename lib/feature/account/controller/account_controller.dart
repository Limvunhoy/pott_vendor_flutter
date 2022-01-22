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

enum PictureType {
  cover,
  profile,
}

class AccountController extends GetxController {
  File? profilePic;
  File? coverPic;
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
  String? _profilePath;
  String? _coverPath;

  SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();

  FetchStatus fetchStatus = FetchStatus.idle;

  late UpdateAccountBodyRequest bodyRequest;

  Future pickImage(ImageSource source, PictureType type) async {
    try {
      final image = await _imagePicker.pickImage(
        source: source,
      );
      if (image == null) return;

      if (type == PictureType.cover) {
        coverPic = File(image.path);
      } else {
        profilePic = File(image.path);
      }
      // await _accountService.uploadImage(profilePic!);
      update();
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  updateBodyRequest(String? profilePic, String? coverPic) {
    bodyRequest = UpdateAccountBodyRequest(
      firstname: firstNameTextController.text.isEmpty
          ? null
          : firstNameTextController.text,
      lastname: lastNameTextController.text.isEmpty
          ? null
          : lastNameTextController.text,
      email: emailTextController.text.isEmpty ? null : emailTextController.text,
      phone: phoneNumberTextController.text.isEmpty
          ? null
          : phoneNumberTextController.text,
      address: addressTextController.text.isEmpty
          ? null
          : addressTextController.text,
      password: passwordTextController.text.isEmpty
          ? null
          : passwordTextController.text,
      photo: profilePic,
      cover: coverPic,
    );
  }

  updateAccountInfo() async {
    try {
      fetchStatus = FetchStatus.loading;
      update();

      if (profilePic != null) {
        await _accountService.uploadImage(profilePic!).then((profilePath) {
          print("KARK PATH: $profilePath");
          _profilePath = profilePath;
          updateBodyRequest(profilePath, _coverPath);
        });
        print("Kark Path: $_profilePath");
      } else if (coverPic != null) {
        _coverPath = await _accountService.uploadImage(coverPic!);
        updateBodyRequest(_profilePath, _coverPath);
      } else {
        updateBodyRequest(_profilePath, _coverPath);
      }

      UserDataResponse currentUser = UserDataResponse.fromJson(
          await _sharedPreferenceHelper.read(SharedPreferenceKey.user));
      final res = await _accountService.updateAccountInfo(
          currentUser.vendorId, bodyRequest.toJson());
      print("Update User Account Info Successfully: ${res.data}");
      fetchStatus = FetchStatus.complete;
      update();
    } catch (e) {
      print("Failed to Update User Account Info: $e");
    }
  }
}
