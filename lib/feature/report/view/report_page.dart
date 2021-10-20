import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/product_option/view/export_widget.dart';
import 'package:pott_vendor/feature/report/view/widgets/chart_widget.dart';
import 'package:pott_vendor/feature/report/view/widgets/total_sale_widget.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Report",
        appBarBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSizeExt.basePadding),
            child: Column(
              children: [
                TotalSaleWidget(type: TotalType.today),
                const SizedBox(
                  height: 16.0,
                ),
                TotalSaleWidget(type: TotalType.month),
                const SizedBox(
                  height: 42.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseTitleText(text: "Activity Statistic"),
                    TextButton.icon(
                      onPressed: () {
                        print("Sort By");
                      },
                      icon: BaseMediumText(
                        text: "Sort by",
                        color: colorExt.LIGHT_GRAY,
                      ),
                      label: Image.asset(
                        AssetPath.SORT_BY_ICON,
                        fit: BoxFit.cover,
                        width: 14.0,
                        height: 14.0,
                      ),
                    ),
                  ],
                ),
                ChartWidget(),
              ],
            ),
          ),
        ));
  }
}
