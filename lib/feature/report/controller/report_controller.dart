import 'package:get/get.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/report/report_response.dart';
import 'package:pott_vendor/core/service/report/report_service.dart';
import 'package:pott_vendor/feature/report/view/widgets/total_sale_widget.dart';

class ReportController extends GetxController {
  ReportService _reportService = ReportService();
  ReportDataResponse? todayReport;
  ReportDataResponse? monthlyReport;

  @override
  void onInit() {
    getTodayReport();
    getMonthlyReport();
    super.onInit();
  }

  getTodayReport() async {
    try {
      todayReport = await _reportService.getReport("today");
      update();
    } catch (e) {
      if (e is ErrorResponse) {}
      print("Failed to get report: $e");
    }
  }

  getMonthlyReport() async {
    try {
      monthlyReport = await _reportService.getReport("monthly");
      update();
    } catch (e) {
      print("Failed to get monthly report: $e");
    }
  }

  String totalSale(TotalType type) {
    switch (type) {
      case TotalType.today:
        return "${todayReport?.records.first.totalPrice ?? "..."}";
      case TotalType.month:
        return "${monthlyReport?.records.first.totalPrice ?? "..."}";
    }
  }

  String totalSaleItem(TotalType type) {
    switch (type) {
      case TotalType.today:
        if ((todayReport?.records.first.totalQty ?? 0) <= 1) {
          return "${(todayReport?.records.first.totalQty ?? 0)} Item";
        } else {
          return "${(todayReport?.records.first.totalQty ?? 0)} Items";
        }
      case TotalType.month:
        if ((monthlyReport?.records.first.totalQty ?? 0) <= 1) {
          return "${(monthlyReport?.records.first.totalQty ?? 0)} Item";
        } else {
          return "${(monthlyReport?.records.first.totalQty ?? 0)} Items";
        }
    }
  }
}
