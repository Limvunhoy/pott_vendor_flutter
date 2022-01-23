import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/core/model/account/update_user_body_request.dart';
import 'package:pott_vendor/core/model/account/update_account_info_response.dart';
import 'package:pott_vendor/core/model/account/upload_image_response.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/core/model/menu/menu_item_model.dart';
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

  SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();

  FetchStatus fetchStatus = FetchStatus.idle;

  late UpdateAccountBodyRequest bodyRequest;
  UploadImageResponse? _profileUploadResponse;
  UploadImageResponse? _coverUploadResponse;

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

  updateBodyRequest(String? profilePath, String? coverPath) {
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
      photo: profilePath != "" ? profilePath : null,
      cover: coverPath != "" ? coverPath : null,
    );
    update();
  }

  Future updateAccountInfo() async {
    try {
      fetchStatus = FetchStatus.loading;
      update();

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
      print("Update User Account Info Successfully: ${res.data}");
      fetchStatus = FetchStatus.complete;
      update();
    } catch (e) {
      if (e is DioError) {
        print("Failed to Update User Account Info: ${e.response!.data}");
      }
    }
  }
}
