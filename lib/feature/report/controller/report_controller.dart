import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  List<String> sortByReports = [
    "Today",
    "Weekly",
    "Monthly",
  ];

  String? sortedBy;

  List<SalesData>? chartData;
  TooltipBehavior? tooltipBehavior;

  @override
  void onInit() {
    getTodayReport();
    getMonthlyReport();

    chartData = sortByToday();

    tooltipBehavior = TooltipBehavior(
      enable: true,
      borderColor: colorExt.PRIMARY_COLOR,
      borderWidth: 1,
      color: Color(0xFFF0FFF9),
      canShowMarker: false,
      textStyle: TextStyle(
          color: colorExt.PRIMARY_COLOR, fontSize: fontSizeExt.smallSize),
    );

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

  handleSortBy(String sortBy) {
    sortedBy = sortBy;
    if (sortBy == "Today") {
      chartData = sortByToday();
    } else if (sortedBy == "Weekly") {
      chartData = sortByToday();
    } else if (sortedBy == "Monthly") {
      chartData = sortByMonthly();
    } else {
      chartData = sortByToday();
    }
    update();
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

  double todayTotalPrice() {
    return todayReport?.records.first.totalPrice.toDouble() ?? 0.0;
  }

  List<SalesData> sortByToday() {
    return <SalesData>[
      SalesData('Mon', todayTotalPrice(), 4000),
      SalesData('Tue', 3000, 3000),
      SalesData('Web', 3000, 3000),
      SalesData('Thu', 2000, 2000),
      SalesData('Fri', 2000, 2000),
      SalesData('Sat', 1000, 1000),
      SalesData('Sun', 1000, 1000),
    ];
  }

  List<SalesData> sortByMonthly() {
    return <SalesData>[
      SalesData('W1', todayTotalPrice(), 4000),
      SalesData('W2', 3000, 3000),
      SalesData('W3', 3000, 3000),
      SalesData('W4', 2000, 2000),
    ];
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
