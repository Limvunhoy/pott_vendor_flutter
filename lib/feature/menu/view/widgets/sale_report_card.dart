import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/menu/controller/menu_controller.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class SaleReportCard extends StatelessWidget {
  const SaleReportCard({Key? key, required this.controller}) : super(key: key);

  final MenuController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -44.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: appSizeExt.basePadding),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 88,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(appSizeExt.baseBorderRadius),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 26.0,
              height: 25.0,
              child: Image.asset(
                AssetPath.WALLET_ICON,
                fit: BoxFit.cover,
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
                  Text(
                    "Total sales Today",
                    style: TextStyle(
                        fontSize: fontSizeExt.smallSize,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Flexible(
                    child: Obx(() {
                      return RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "USD",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSizeExt.extraSmallSize),
                            ),
                            TextSpan(
                              text: controller.fetchStatus.value ==
                                      FetchStatus.loading
                                  ? " ..."
                                  : controller.todaySale.value.isNotEmpty
                                      ? " \$${controller.todaySale.value}"
                                      : " \$0",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSizeExt.largeSize,
                                  fontWeight: fontWeightExt.baseFontWeight),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Yesterday",
                  style: TextStyle(
                      fontSize: fontSizeExt.extraSmallSize,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Obx(() {
                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "USD",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: controller.fetchStatus.value ==
                                  FetchStatus.loading
                              ? " ..."
                              : controller.yesterdaySale.value.isNotEmpty
                                  ? " \$${controller.yesterdaySale.value}"
                                  : " \$0",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSizeExt.extraSmallSize,
                              fontWeight: fontWeightExt.baseFontWeight),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
