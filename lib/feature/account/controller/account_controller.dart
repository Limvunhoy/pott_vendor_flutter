import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/core/model/account/update_user_body_request.dart';
import 'package:pott_vendor/core/model/account/update_account_info_response.dart';
import 'package:pott_vendor/core/model/account/upload_image_response.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/core/service/account/account_service.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/sign_in/controller/auth_controller.dart';
import 'package:pott_vendor/utils/constants/shared_preference_keys.dart';
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

  SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();

  late UpdateAccountBodyRequest bodyRequest;
  UploadImageResponse? _profileUploadResponse;
  UploadImageResponse? _coverUploadResponse;

  AuthController authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
  }

  bool isUpdateButtonEnabled = false;

  checkEnableUpdateButton() {
    if (firstNameTextController.text.isNotEmpty ||
        lastNameTextController.text.isNotEmpty ||
        emailTextController.text.isNotEmpty ||
        phoneNumberTextController.text.isNotEmpty ||
        addressTextController.text.isNotEmpty ||
        passwordTextController.text.isNotEmpty ||
        profilePic != null ||
        coverPic != null) {
      isUpdateButtonEnabled = true;
    } else {
      isUpdateButtonEnabled = false;
    }
    update();
  }

  @override
  void onClose() {
    profilePic = null;
    coverPic = null;

    firstNameTextController.dispose();
    lastNameTextController.dispose();
    phoneNumberTextController.dispose();
    emailTextController.dispose();
    addressTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

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

      checkEnableUpdateButton();
      update();
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  String _phoneNumberFormat() {
    return phoneNumberTextController.text.contains("+855")
        ? phoneNumberTextController.text
        : "+855${phoneNumberTextController.text}";
  }

  updateBodyRequest(String? profilePath, String? coverPath) {
    bodyRequest = UpdateAccountBodyRequest(
      firstname: firstNameTextController.text.isEmpty
          ? null
          : firstNameTextController.text,
      lastname: lastNameTextController.text.isEmpty
          ? null
          : lastNameTextController.text,
      email: emailTextController.text.isEmpty ? null : emailTextController.text,
      phone:
          phoneNumberTextController.text.isEmpty ? null : _phoneNumberFormat(),
      address: addressTextController.text.isEmpty
          ? null
          : addressTextController.text,
      password: passwordTextController.text.isEmpty
          ? null
          : passwordTextController.text,
      photo: profilePath != "" ? profilePath : null,
      cover: coverPath != "" ? coverPath : null,
    );
    update();
  }

  Future updateAccountInfo() async {
    Get.showOverlay(
      asyncFunction: () async {
        try {
          if (profilePic != null) {
            await _accountService.uploadImage(profilePic!).then((res) {
              if (res != null) {
                _profileUploadResponse = res;
              }
            });
          }

          if (coverPic != null) {
            await _accountService.uploadImage(coverPic!).then((res) {
              if (res != null) {
                _coverUploadResponse = res;
              }
            });
          }

          updateBodyRequest(_profileUploadResponse?.results.path ?? null,
              _coverUploadResponse?.results.path ?? null);

          UserDataResponse currentUser = UserDataResponse.fromJson(
              await _sharedPreferenceHelper.read(SharedPreferenceKey.user));
          final res = await _accountService.updateAccountInfo(
              currentUser.vendorId, bodyRequest.toJson());

          resetData();

          UserDataResponse? _copyUser = authController.auth;

          authController.auth = _copyUser?.copyWith(
            firstName: res.data.firstName,
            lastName: res.data.lastName,
            phone: res.data.phone,
            photo: res.data.photo,
            cover: res.data.cover,
          );

          authController.saveUser(authController.auth!);
          print("Update User Account Info Successfully: ${res.data}");

          isUpdateButtonEnabled = false;
          update();
        } catch (e) {
          Get.snackbar("Something went wrong!", "$e",
              snackPosition: SnackPosition.BOTTOM);
        }
      },
      loadingWidget: Center(
        child: CircularProgressIndicator(
          color: colorExt.PRIMARY_COLOR,
        ),
      ),
    );
  }
}

extension on AccountController {
  resetData() {
    profilePic = null;
    coverPic = null;
    firstNameTextController.clear();
    lastNameTextController.clear();
    emailTextController.clear();
    phoneNumberTextController.clear();
    addressTextController.clear();
    passwordTextController.clear();

    update();
  }
}
