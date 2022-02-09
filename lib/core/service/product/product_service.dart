import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';
import 'package:pott_vendor/utils/constants/app_constants.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

enum ProductType {
  sell,
  bid,
}

class ProductService {
  ApiBaseHelper _apiBaseHelper = Get.find<ApiBaseHelper>();

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

  Future<String> updateProductStatus(String id, String status) async {
    final bodyRequest = {"_id": id, "status": status};
    try {
      final res =
          await _apiBaseHelper.put(EndPoint.updateProductStatus, bodyRequest);
      if (res.data["httpCode"] == 200) {
        return res.data["data"]["status"];
      } else {
        throw ErrorResponse.fromJson(res.data);
      }
    } catch (e) {
      throw e;
    }
  }
}
