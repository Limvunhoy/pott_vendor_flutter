import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/product_option/view/export_widget.dart';
import 'package:pott_vendor/feature/report/controller/report_controller.dart';
import 'package:pott_vendor/feature/report/view/widgets/no_data_report.dart';
import 'package:pott_vendor/feature/report/view/widgets/total_sale_widget.dart';

class ReportPage extends GetWidget<ReportController> {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Report",
      appBarBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GetBuilder(
            init: controller,
            builder: (_) {
              return Container(
                padding: const EdgeInsets.all(appSizeExt.basePadding),
                child: Column(
                  children: [
                    controller.todayReport != null
                        ? TotalSaleWidget(
                            type: TotalType.today,
                            reportController: controller,
                          )
                        : NoDataReport(type: TotalType.today),
                    const SizedBox(
                      height: 16.0,
                    ),
                    controller.monthlyReport != null
                        ? TotalSaleWidget(
                            type: TotalType.month, reportController: controller)
                        : NoDataReport(type: TotalType.month)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
