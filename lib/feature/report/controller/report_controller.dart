import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/report/report_response.dart';
import 'package:pott_vendor/core/service/report/report_service.dart';
import 'package:pott_vendor/feature/report/view/widgets/chart_widget.dart';
import 'package:pott_vendor/feature/report/view/widgets/total_sale_widget.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportController extends GetxController {
  ReportService _reportService = ReportService();
  ReportDataResponse? todayReport;
  ReportDataResponse? monthlyReport;
  ReportDataResponse? weeklyReport;

  List<String> sortByReports = [
    "Weekly",
    "Monthly",
  ];

  String? sortedBy;

  List<SalesData>? chartData;
  TooltipBehavior? tooltipBehavior;

  @override
  void onInit() async {
    await getTodayReport();
    await getMonthlyReport();
    await getWeeklyReport();

    tooltipBehavior = TooltipBehavior(
      enable: true,
      borderColor: colorExt.PRIMARY_COLOR,
      borderWidth: 1,
      color: Color(0xFFF0FFF9),
      canShowMarker: false,
      textStyle: TextStyle(
          color: colorExt.PRIMARY_COLOR, fontSize: fontSizeExt.smallSize),
    );

    chartData = sortByWeekly();
    update();

    super.onInit();
  }

  handleSortBy(String sortBy) {
    sortedBy = sortBy;
    if (sortBy == "Weekly") {
      chartData = sortByWeekly();
    } else {
      chartData = sortByMonthly();
    }
    update();
  }

  String totalSale(TotalType type) {
    switch (type) {
      case TotalType.today:
        return "${todayReport?.records.first.totalPrice ?? "0"}";
      case TotalType.month:
        return "${monthlyReport?.records.first.totalPrice ?? "0"}";
    }
  }

  double todayTotalPrice() {
    return todayReport?.records.first.totalPrice.toDouble() ?? 0.0;
  }

  String reportDate(DateTime date) {
    String formattedDate = DateFormat('MM-dd').format(date);
    return formattedDate;
  }

  List<SalesData> sortByWeekly() {
    List<SalesData> salesData = weeklyReport?.records
            .map((e) => SalesData(reportDate(e.id), e.totalPrice.toDouble(),
                e.totalPrice.toDouble()))
            .toList() ??
        [];

    return salesData;
  }

  List<SalesData> initChart() {
    return <SalesData>[
      SalesData('...', 0, 0),
      SalesData('...', 0, 0),
      SalesData('...', 0, 0),
      SalesData('...', 0, 0),
    ];
  }

  List<SalesData> sortByMonthly() {
    List<SalesData> salesData = monthlyReport?.records
            .map((e) => SalesData(reportDate(e.id), e.totalPrice.toDouble(),
                e.totalPrice.toDouble()))
            .toList() ??
        [];

    return salesData;
  }

  String strItem = "";

  String totalSaleItem(TotalType type) {
    switch (type) {
      case TotalType.today:
        if ((todayReport?.records.first.totalQty ?? 0) <= 1) {
          return "${(todayReport?.records.first.totalQty ?? 0)}";
        } else {
          return "${(todayReport?.records.first.totalQty ?? 0)}";
        }
      case TotalType.month:
        if ((monthlyReport?.records.first.totalQty ?? 0) <= 1) {
          return "${(monthlyReport?.records.first.totalQty ?? 0)}";
        } else {
          return "${(monthlyReport?.records.first.totalQty ?? 0)}";
        }
    }
  }

  String itemFormat(TotalType type) {
    switch (type) {
      case TotalType.today:
        return (todayReport?.records.first.totalQty ?? 0) > 1
            ? " Items"
            : " Item";
      case TotalType.month:
        return (monthlyReport?.records.first.totalQty ?? 0) > 1
            ? " Items"
            : " Item";
    }
  }
}

// MARK: - Get Report: Today, Weekly, Monthly
extension on ReportController {
  getTodayReport() async {
    try {
      todayReport = await _reportService.getReport("today");
      update();
    } catch (e) {
      if (e is ErrorResponse) {}
      print("Failed to get report: $e");
    }
  }

  getWeeklyReport() async {
    try {
      weeklyReport = await _reportService.getReport("weekly");
      update();
    } catch (e) {
      print("Failed to get monthly report: $e");
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
}
