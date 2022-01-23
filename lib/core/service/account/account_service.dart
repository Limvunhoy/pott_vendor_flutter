import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getX;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/account/update_account_info_response.dart';
import 'package:pott_vendor/core/model/account/upload_image_response.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

class AccountService {
  ApiBaseHelper _apiBaseHelper = getX.Get.find<ApiBaseHelper>();

  Future<UpdateAccountInfoResponse> updateAccountInfo(
      int userId, bodyRequest) async {
    try {
      final response = await _apiBaseHelper.put(
          "${EndPoint.updateUserInfo}/$userId", bodyRequest);
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

  Future<UploadImageResponse?> uploadImage(File selectedImage) async {
    String fileName = selectedImage.path.split("/").last;
    String? mimeType = mime(selectedImage.path);
    String mimee = mimeType!.split('/')[0];
    String type = mimeType.split('/')[1];

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(selectedImage.path,
          filename: fileName, contentType: MediaType(mimee, type)),
    });

    try {
      final response = await Dio().post(url,
          data: data,
          options: Options(contentType: "multipart/form-data", headers: {
            "Content-Type": "multipart/form-data",
            "accept": "*/*",
            "Connection": "keep-alive"
          }));

      if (response.statusCode == 200) {
        return UploadImageResponse.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        print("Upload error ${e.response!.data}");
      }
      throw e;
    }
  }
}
