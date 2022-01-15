import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/report/view/widgets/total_sale_widget.dart';
import 'package:pott_vendor/utils/common/base_large_text.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class NoDataReport extends StatelessWidget {
  const NoDataReport({Key? key, required this.type}) : super(key: key);

  final TotalType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
      child: BaseLargeText(
        text: "No Data",
        color: Colors.white,
        fontWeight: fontWeightExt.baseFontWeight,
      ),
    );
  }
}
