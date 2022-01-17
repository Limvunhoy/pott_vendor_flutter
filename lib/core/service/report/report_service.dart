import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/report/report_response.dart';
import 'package:pott_vendor/utils/constants/end_poing.dart';

class ReportService {
  ApiBaseHelper _apiBaseHelper = Get.find<ApiBaseHelper>();

  Future<ReportDataResponse?> getReport(String type) async {
    try {
      var res = await _apiBaseHelper.get("${EndPoint.report}?type=$type");

      if (res.data["httpCode"] == 200) {
        print("Get Order Success");
        return ReportDataResponse.fromJson(res.data["data"]);
      } else {
        throw ErrorResponse.fromJson(res.data);
      }
    } catch (e) {
      throw e;
    }
  }
}
