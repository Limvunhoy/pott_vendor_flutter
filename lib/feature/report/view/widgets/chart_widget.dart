import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      borderColor: colorExt.PRIMARY_COLOR,
      borderWidth: 1,
      color: Color(0xFFF0FFF9),
      canShowMarker: false,
      textStyle: TextStyle(
          color: colorExt.PRIMARY_COLOR, fontSize: fontSizeExt.smallSize),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.width,
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
            maximumLabelWidth: 30,

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

          tooltipBehavior: _tooltipBehavior,
          onTooltipRender: (TooltipArgs args) {
            args.header = "";
            args.text = "\$${_chartData[args.pointIndex!.toInt()].sales}";
          },
          series: <ChartSeries>[
            ColumnSeries<SalesData, String>(
              enableTooltip: true,
              dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.salesMonth,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // Sets the corner radius
              color: colorExt.PRIMARY_COLOR,
              borderWidth: 10,
              width: 0.2,
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

  List<SalesData> getChartData() {
    return <SalesData>[
      SalesData('Mon', 4000, 4000),
      SalesData('Tue', 3000, 3000),
      SalesData('Web', 3000, 3000),
      SalesData('Thu', 2000, 2000),
      SalesData('Fri', 2000, 2000),
      SalesData('Sat', 1000, 1000),
      SalesData('Sun', 1000, 1000),
    ];
  }
}

class SalesData {
  SalesData(this.salesMonth, this.sales, this.profit);
  final String salesMonth;
  final double sales;
  final double profit;
}
