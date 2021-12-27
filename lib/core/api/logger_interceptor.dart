import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/feature/sign_in/controller/auth_controller.dart';
import 'package:pott_vendor/utils/constants/shared_preference_keys.dart';
import 'package:pott_vendor/utils/helper/shared_preference_helper.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor();

  static SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint("*** REQUEST LOG ***");
    printKV("URL", options.uri);
    printKV("METHOD", options.method);
    logPrint("HEADERS:");
    options.headers.forEach((key, value) => printKV("-$key", value));
    logPrint("BODY:");
    printAll(options.data ?? "");
    logPrint("*** END LOG ***");

    if (options.headers.containsKey("requiresToken")) {
      return handler.next(options);
    }

    // return requestInterceptor(options);
    // return super.onRequest(options, handler);
    UserDataResponse currentUser = UserDataResponse.fromJson(
        await _sharedPreferenceHelper.read(SharedPreferenceKey.user));

    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTZjNDBmNTU0NTM2ZTI5N2MzYzI0NjAiLCJ2ZW5kb3JJZCI6IjE1IiwiZmlyc3ROYW1lIjoiU2VuIiwibGFzdE5hbWUiOiJUb2xhIiwicGhvbmUiOiIrODU1OTAzMDMwMjAiLCJzdGF0dXMiOiJhY3RpdmF0ZWQiLCJhY2NvdW50VmVyaWZ5IjpmYWxzZSwicm9sZSI6InZlbmRvciIsImlhdCI6MTY0MDA5Mzc3Mn0.YSU8HL-W77KDqMzXBwLBvEp0aJJ4SAbuW0QaxalNqmk";
    if (currentUser.token != "") {
      token = currentUser.token; // this token should get from share preference
    }

    options.headers.addAll({"authorization": "Bearer $token"});

    return handler.next(options);
  }

  // static Future<String> getCurrentUser() async {
  //   try {
  //     UserDataResponse? currentUser = UserDataResponse.fromJson(
  //         await _sharedPreferenceHelper.read(SharedPreferenceKey.user));
  //
  //     return currentUser.token;
  //   } catch (e) {
  //     print("Failed to Read User From Local Storage $e");
  //     return "";
  //   }
  // }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token

    UserDataResponse currentUser = UserDataResponse.fromJson(
        await _sharedPreferenceHelper.read(SharedPreferenceKey.user));

    String token = "";
    if (currentUser.token != "") {
      token = currentUser.token; // this token should get from share preference
    }

    options.headers.addAll({
      "authorization": "Bearer: $token",
    });

    return options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint("*** RESPONSE LOG ***");
    printKV("URL", response.realUri);
    printKV("STATUS CODE", response.statusCode);
    logPrint("BODY:");
    printAll(response.data);
    logPrint("*** END LOG ***");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logPrint("*** ERROR LOG ***");
    printKV("URL:", err.requestOptions.uri);
    printKV("STATUS CODE:", err.response!.statusCode.toString());
    logPrint("$err");
    if (err.response != null) {
      logPrint("BODY:");
      printAll(err.message.toString());
    }
    logPrint("*** END LOG");
    return super.onError(err, handler);
  }

  void printAll(msg) {
    msg.toString().split("\n").forEach(logPrint);
  }

  void printKV(String key, dynamic v) {
    logPrint("$key: $v");
  }

  void logPrint(String s) {
    debugPrint(s);
  }
}
