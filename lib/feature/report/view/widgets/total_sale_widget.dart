import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/report/controller/report_controller.dart';
import 'package:pott_vendor/utils/common/base_extra_small_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';

enum TotalType {
  today,
  month,
}

class TotalSaleWidget extends StatelessWidget {
  const TotalSaleWidget(
      {Key? key, required this.type, required this.reportController})
      : super(key: key);

  final TotalType type;
  final ReportController reportController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(appSizeExt.baseBorderRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: type == TotalType.today
              ? AssetImage(AssetPath.TOTAL_SALE_TODAY_BG)
              : AssetImage(AssetPath.TOTAL_SALE_THIS_MONTH_BG),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 26.0,
            height: 25.0,
            child: Image.asset(
              AssetPath.WALLET_ICON,
              fit: BoxFit.cover,
              color: type == TotalType.today
                  ? Colors.white
                  : colorExt.PRIMARY_COLOR,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseSmallText(
                  text: type == TotalType.today
                      ? "Total sales Today"
                      : "Total sales this month",
                  color: type == TotalType.today
                      ? Colors.white
                      : colorExt.PRIMARY_COLOR,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "USD",
                          style: TextStyle(
                              color: type == TotalType.today
                                  ? Colors.white
                                  : colorExt.PRIMARY_COLOR,
                              fontSize: fontSizeExt.extraSmallSize),
                        ),
                        TextSpan(
                          text: " \$${reportController.totalSale(type)}",
                          style: TextStyle(
                              color: type == TotalType.today
                                  ? Colors.white
                                  : colorExt.PRIMARY_COLOR,
                              fontSize: fontSizeExt.largeSize,
                              fontWeight: fontWeightExt.baseFontWeight),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BaseExtraSmallText(
                text: "Total Solid",
                color: type == TotalType.today
                    ? Colors.white
                    : colorExt.PRIMARY_COLOR,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10.0,
              ),
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: reportController.totalSaleItem(type),
                      style: TextStyle(
                          color: type == TotalType.today
                              ? Colors.white
                              : colorExt.PRIMARY_COLOR,
                          fontSize: fontSizeExt.extraSmallSize,
                          fontWeight: fontWeightExt.baseFontWeight),
                    ),
                    TextSpan(
                      text: reportController.itemFormat(type),
                      style: TextStyle(
                        fontSize: 10.0,
                        color: type == TotalType.today
                            ? Colors.white
                            : colorExt.PRIMARY_COLOR,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
