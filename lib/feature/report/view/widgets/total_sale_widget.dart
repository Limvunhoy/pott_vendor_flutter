import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/common/base_extra_small_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';

enum TotalType {
  today,
  month,
}

class TotalSaleWidget extends StatelessWidget {
  const TotalSaleWidget({Key? key, required this.type}) : super(key: key);

  final TotalType type;

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
                  text: "Total sales Today",
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
                          text: " \$1.500.00",
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
            children: [
              BaseExtraSmallText(
                text: "Total Yesterday",
                color: type == TotalType.today
                    ? Colors.white
                    : colorExt.PRIMARY_COLOR,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "USD",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: type == TotalType.today
                            ? Colors.white
                            : colorExt.PRIMARY_COLOR,
                      ),
                    ),
                    TextSpan(
                      text: " \$1.200.00",
                      style: TextStyle(
                          color: type == TotalType.today
                              ? Colors.white
                              : colorExt.PRIMARY_COLOR,
                          fontSize: fontSizeExt.extraSmallSize,
                          fontWeight: fontWeightExt.baseFontWeight),
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
