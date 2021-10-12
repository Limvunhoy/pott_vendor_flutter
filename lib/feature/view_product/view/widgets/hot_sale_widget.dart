import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class HotSaleWidget extends StatelessWidget {
  const HotSaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFE54A81),
            const Color(0xFFF48221),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetPath.HOT_SALE_ICON,
            fit: BoxFit.cover,
            width: 92.91,
            height: 17.0,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "10 minutes ago",
                  style: TextStyle(
                      color: Colors.white, fontSize: fontSizeExt.smallSize),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6.0),
                      bottomLeft: Radius.circular(6.0),
                    ),
                  ),
                  child: Text(
                    "29 sold",
                    style: TextStyle(
                      fontSize: fontSizeExt.mediumSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
