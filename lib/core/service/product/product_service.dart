import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/account/upload_image_response.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';
import 'package:pott_vendor/utils/constants/app_constants.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

enum ProductType {
  sell,
  bid,
}

class ProductService {
  ApiBaseHelper _apiBaseHelper = getX.Get.find<ApiBaseHelper>();

  Future<ProductDataResponse?> queryProduct(String type, int page) async {
    final bodyRequest = {
      "type": type,
    };
    try {
      final res = await _apiBaseHelper.post(
          "${EndPoint.queryProduct}?limit=$fetchProductLimit&page=$page",
          bodyRequest);
      if (res.data["httpCode"] == 200) {
        return ProductDataResponse.fromJson(res.data["data"]);
      } else {
        throw ErrorResponse.fromJson(res.data);
      }
    } catch (e) {
      throw e;
    }
  }

  String url = "https://storage.pottbid.com/storage/upload-image-product";

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

  Future<bool> addProduct(AddProductBodyRequest bodyRequest) async {
    try {
      final response =
          await _apiBaseHelper.post(EndPoint.addProduct, bodyRequest.toJson());
      if (response.data["httpCode"] == 200) {
        return true;
      } else {
        throw ErrorResponse.fromJson(response.data);
      }
    } catch (e) {
      throw e;
    }
  }
}
