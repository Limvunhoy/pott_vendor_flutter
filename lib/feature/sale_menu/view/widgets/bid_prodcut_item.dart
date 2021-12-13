import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BidProductItem extends StatelessWidget {
  const BidProductItem({Key? key, required this.onItemTapped})
      : super(key: key);

  final VoidCallback onItemTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTapped,
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          appSizeExt.basePadding,
          appSizeExt.basePadding,
          appSizeExt.basePadding,
          0.0,
        ),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(appSizeExt.basePadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                Container(
                  width: 100.0,
                  height: 100.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Unpublished",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeExt.extraSmallSize),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "iPhone 13 Pro Max new arrival",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSizeExt.mediumSize),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
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
                                AssetPath.BID_ICON,
                                fit: BoxFit.cover,
                                width: 43.0,
                                height: 14.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF1F0),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Text(
                            "Sold out",
                            style:
                                TextStyle(color: colorExt.RED, fontSize: 10.0),
                          ),
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
                          AssetPath.IN_STOCK_ICON,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
