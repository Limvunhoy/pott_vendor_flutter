import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class BidPriceStarting extends StatelessWidget {
  const BidPriceStarting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Row(
        children: [
          Image.asset(
            AssetPath.STARTING_BID_ICON,
            fit: BoxFit.cover,
            width: 24.0,
            height: 27.0,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              "Bid price starting from \$200. The price for bid product one time \$0.01 per 15 second.",
              style: TextStyle(
                  color: Colors.black, fontSize: fontSizeExt.extraSmallSize),
            ),
          )
        ],
      ),
    );
  }
}
