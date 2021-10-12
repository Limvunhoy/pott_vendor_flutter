import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/report/view/widgets/total_sale_widget.dart';

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
              ],
            ),
          ),
        ));
  }
}
