import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/report/controller/report_controller.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key, required this.controller}) : super(key: key);

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.width / 1.5,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          // legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(
            // title: AxisTitle(text: 'Primary X Axis'),
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(width: 0),
            axisLine: AxisLine(width: 0),
            labelIntersectAction: AxisLabelIntersectAction.rotate45,
            // labelRotation: 90,
            maximumLabelWidth: 50,

            interactiveTooltip: InteractiveTooltip(
              borderWidth: 5,
              borderColor: Colors.red,
              color: Colors.red,
            ),

            labelStyle: TextStyle(
                color: colorExt.LIGHT_GRAY, fontWeight: FontWeight.w500),
          ),
          primaryYAxis: NumericAxis(
            majorGridLines: MajorGridLines(
              width: 1,
              dashArray: [2, 2],
            ),
            axisLine: AxisLine(width: 0),
            labelStyle: TextStyle(
                color: colorExt.LIGHT_GRAY, fontWeight: FontWeight.w500),
            // title: AxisTitle(text: 'Primary Y Axis (Sales in USD Millions)'),
          ),
          // axes: <ChartAxis>[
          //   CategoryAxis(
          //       name: 'xAxis',
          //       title: AxisTitle(text: 'Secondary X Axis'),
          //       opposedPosition: true),
          //   NumericAxis(
          //       name: 'yAxis',
          //       title: AxisTitle(
          //           text: 'Secondary Y Axis (Profit in USD Millions)'),
          //       opposedPosition: true,
          //       interval: 5)
          // ],

          tooltipBehavior: controller.tooltipBehavior,
          onTooltipRender: (TooltipArgs args) {
            args.header = "";
            args.text =
                "\$${controller.chartData?[args.pointIndex!.toInt()].sales}";
          },
          series: <ChartSeries>[
            ColumnSeries<SalesData, String>(
              enableTooltip: true,
              dataSource: controller.chartData ?? [],
              xValueMapper: (SalesData sales, _) => sales.salesMonth,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // Sets the corner radius
              color: colorExt.PRIMARY_COLOR,
              borderWidth: 5,
              width: 0.1,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              // selectionBehavior: SelectionBehavior(
              //   // enable: true,
              //   selectedColor: Colors.yellow,
              //   unselectedColor: Colors.red,
              // ),
            )
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.salesMonth, this.sales, this.profit);
  final String salesMonth;
  final double sales;
  final double profit;
}
