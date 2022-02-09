import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';
import 'package:pott_vendor/feature/sale_menu/controller/sale_menu_controller.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class SaleProductItem extends StatelessWidget {
  const SaleProductItem(
      {Key? key,
      required this.onItemTapped,
      required this.saleProduct,
      required this.controller,
      required this.onToggleSwitch})
      : super(key: key);

  final VoidCallback onItemTapped;
  final ProductRecord saleProduct;
  final SaleMenuController controller;
  final VoidCallback onToggleSwitch;

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
                    // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqVmFDtPzb1NE0UOaixF8W7gQfqkwc5RFXRw&usqp=CAU",
                    saleProduct.image,
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                saleProduct.status == "true"
                    ? const SizedBox.shrink()
                    : Container(
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
                    saleProduct.name,
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
                        "\$${saleProduct.salePrice}",
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
                                AssetPath.IN_STOCK_ICON,
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
                                    AssetPath.EDIT_ICON,
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
                      Container(
                        alignment: Alignment.centerRight,
                        width: 23.0,
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Ink(
                            child: InkWell(
                              onTap: onToggleSwitch,
                              child: Image.asset(
                                saleProduct.status == "true"
                                    ? "assets/icons/sale_menu/switch_active_icon.png"
                                    : "assets/icons/sale_menu/switch_inactive_icon.png",
                                fit: BoxFit.cover,
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
      ),
    );
  }
}
