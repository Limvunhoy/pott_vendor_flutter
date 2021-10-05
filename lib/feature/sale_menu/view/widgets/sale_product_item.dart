import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/sale_menu/controller/sale_menu_controller.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class SaleProductItem extends StatelessWidget {
  const SaleProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<SaleMenuController>();

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF1F0),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text(
                        "Sold out",
                        style: TextStyle(color: colorExt.RED, fontSize: 10.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
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
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
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
                    const SizedBox(
                      width: 43.5,
                    ),
                    Obx(
                      () {
                        return Container(
                          alignment: Alignment.centerRight,
                          // color: Colors.red,
                          width: 23.0,
                          height: 12.0,
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            child: Ink(
                              child: InkWell(
                                onTap: () {
                                  _controller.handleSwitch();
                                },
                                child: Image.asset(
                                  _controller.isOn.isTrue
                                      ? "assets/icons/sale_menu/switch_active_icon.png"
                                      : "assets/icons/sale_menu/switch_inactive_icon.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
