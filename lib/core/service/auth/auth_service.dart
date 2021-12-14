import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

class AuthService {
  ApiBaseHelper _apiBaseHelper = Get.find<ApiBaseHelper>();

  Future<UserResponse> login(String phone, String password) async {
    final bodyRequest = {"phone": phone, "password": password};

    try {
      var response = await _apiBaseHelper.post(EndPoint.login, bodyRequest);

      if (response.data["httpCode"] == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw ErrorResponse.fromJson(response.data);
      }
    } catch (e) {
      throw e;
    }
  }
}
