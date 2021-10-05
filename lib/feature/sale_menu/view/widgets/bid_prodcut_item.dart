import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BidProductItem extends StatelessWidget {
  const BidProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        defaultSizeExt.basePadding,
        defaultSizeExt.basePadding,
        defaultSizeExt.basePadding,
        0.0,
      ),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultSizeExt.basePadding),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqVmFDtPzb1NE0UOaixF8W7gQfqkwc5RFXRw&usqp=CAU",
              fit: BoxFit.cover,
              width: 100.0,
              height: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "iPhone 13 Pro Max new arrival",
                  style: TextStyle(
                      color: Colors.black, fontSize: fontSizeExt.mediumSize),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$1500.00",
                      style: TextStyle(
                          color: colorExt.RED,
                          fontSize: fontSizeExt.mediumSize,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Image.asset(
                      ImagePathConstant.BID_ICON,
                      fit: BoxFit.cover,
                      width: 43.0,
                      height: 14.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Buy it now \$ 1300.00",
                  style: TextStyle(
                    color: colorExt.DARK_GRAY,
                    fontSize: fontSizeExt.smallSize,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImagePathConstant.IN_STOCK_ICON,
                      fit: BoxFit.cover,
                      width: 14.01,
                      height: 13.01,
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      "Stock 10",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: fontSizeExt.smallSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
