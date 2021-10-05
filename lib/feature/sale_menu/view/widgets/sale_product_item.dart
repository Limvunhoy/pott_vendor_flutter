import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class SaleProductItem extends StatelessWidget {
  const SaleProductItem({Key? key}) : super(key: key);

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
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
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
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 4.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    "Sold 10",
                    style: TextStyle(
                      color: colorExt.DARK_GRAY,
                      fontSize: fontSizeExt.smallSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      child: Row(
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
                            "Stock 0",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSizeExt.smallSize,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: Ink(
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  ImagePathConstant.EDIT_ICON,
                                  fit: BoxFit.cover,
                                  width: 9.0,
                                  height: 10.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeExt.smallSize),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
