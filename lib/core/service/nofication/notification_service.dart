import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

class NotificationService {
  final ApiBaseHelper _apiBaseHelper = Get.find<ApiBaseHelper>();

  Future registerToken(String token, String message) async {
    final bodyRequest = {
      "registrationToken": token,
      "message": message,
    };

    try {
      // var res =
      await _apiBaseHelper.post(EndPoint.registerNotification, bodyRequest);
      // debugPrint("Notification Response: $res");
    } catch (e) {
      throw e;
    }
  }
}
