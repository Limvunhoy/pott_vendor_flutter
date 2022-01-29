import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/utils/constants/app_constants.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

class OrderService {
  ApiBaseHelper _apiBaseHelper = Get.find<ApiBaseHelper>();

  Future<OrderDataResponse?> getQueryOrder(
      String vendorId, String status, RxInt page) async {
    final bodyRequest = {"vendorId": vendorId, "status": status};

    try {
      var res = await _apiBaseHelper.post(
          "${EndPoint.order}?limit=$fetchLimit&page=${page.value}",
          bodyRequest);

      if (res.data["httpCode"] == 200) {
        print("Get Order Success");
        return OrderDataResponse.fromJson(res.data["data"]);
      } else {
        throw ErrorResponse.fromJson(res.data);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<bool> updateOrderStatus(String id, String status) async {
    final bodyRequest = {
      "_id": id,
      "status": status,
    };

    try {
      final res =
          await _apiBaseHelper.post(EndPoint.updateOrderStatus, bodyRequest);

      if (res.data["httpCode"] == 200) {
        print("Update Order Status Successfully");
        return true;
      }
      return false;
    } catch (e) {
      throw e;
    }
  }
}
