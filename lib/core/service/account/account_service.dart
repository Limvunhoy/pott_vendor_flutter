import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getX;
import 'package:http_parser/http_parser.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/account/updateUserBodyRequest.dart';
import 'package:pott_vendor/core/model/account/update_account_info_response.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

class AccountService {
  ApiBaseHelper _apiBaseHelper = getX.Get.find<ApiBaseHelper>();
  var _dio = Dio();

  Future<UpdateAccountInfoResponse> updateAccountInfo(
      int userId, UpdateAccountBodyRequest bodyRequest) async {
    try {
      final response = await _apiBaseHelper.put(
          "${EndPoint.updateUserInfo}/$userId", bodyRequest.toJson());
      if (response.data["httpCode"] == 200) {
        return UpdateAccountInfoResponse.fromJson(response.data);
      } else {
        throw ErrorResponse.fromJson(response.data);
      }
    } catch (e) {
      throw e;
    }
  }

  String url = "https://storage.pottbid.com/storage/upload-image-user";

  void uploadImage(File file) async {
    String fileName = file.path.split("/").last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType("image", "jpg"),
      ),
    });

    print("File Name: $fileName, file path: ${file.path}");

    await _dio
        .post(url,
            data: formData,
            options: Options(headers: {
              "Content-Type": "multipart/form-data",
              "Accept": "*/*"
            }))
        .then((response) {
      print("Upload Response $response");
    }).catchError((error) {
      print("Upload error $error");
    });

    // try {
    //   String fileName = file.path.split("/").last;
    //   FormData formData = FormData.fromMap({
    //     "file": await MultipartFile.fromFile(file.path, filename: fileName),
    //   });
    //
    //   String url = "https://storage.pottbid.com/storage/upload-image-user";
    //   final response = await _dio.post(url, data: file.openRead());
    //
    //   print("upload response $response");
    //   if (response.statusCode == 200) {
    //     return UpdateUserProfileResponse.fromJson(response.data);
    //   } else {
    //     throw "Failed to Upload Image";
    //   }
    // } catch (e) {
    //   throw e;
    // }
  }
}
