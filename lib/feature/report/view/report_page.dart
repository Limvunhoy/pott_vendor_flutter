import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/product_option/view/export_widget.dart';
import 'package:pott_vendor/feature/report/view/widgets/chart_widget.dart';
import 'package:pott_vendor/feature/report/controller/report_controller.dart';
import 'package:pott_vendor/feature/report/view/widgets/total_sale_widget.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';

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
                  TotalSaleWidget(
                    type: TotalType.today,
                    reportController: controller,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TotalSaleWidget(
                      type: TotalType.month, reportController: controller),
                  // : NoDataReport(type: TotalType.month),
                  const SizedBox(
                    height: 42.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseTitleText(text: "Activity Statistic"),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Image.asset(
                            AssetPath.SORT_BY_ICON,
                            fit: BoxFit.cover,
                            width: 14.0,
                          ),
                          hint: BaseMediumText(
                            text: "Sort by",
                            color: colorExt.LIGHT_GRAY,
                            fontWeight: FontWeight.w600,
                          ),
                          value: controller.sortedBy,
                          items: controller.sortByReports
                              .map(buildMenuItem)
                              .toList(),
                          onChanged: (selectedValue) {
                            controller.handleSortBy(selectedValue!);
                          },
                        ),
                      ),
                    ],
                  ),
                  ChartWidget(
                    controller: controller,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Container(
          padding: const EdgeInsets.only(right: 8.0),
          child: BaseMediumText(
            text: item,
            textAlign: TextAlign.right,
          ),
        ),
      );
}
