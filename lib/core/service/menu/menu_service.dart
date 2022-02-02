import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/menu/home_report_response.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

class MenuService {
  ApiBaseHelper _apiBaseHelper = Get.find<ApiBaseHelper>();

  Future<HomeReportData?> getHomeReport() async {
    try {
      var res = await _apiBaseHelper.get(EndPoint.homeReport);

      if (res.data["httpCode"] == 200) {
        return HomeReportData.fromJson(res.data["data"]);
      } else {
        throw ErrorResponse.fromJson(res.data);
      }
    } catch (e) {
      throw e;
    }
  }
}
