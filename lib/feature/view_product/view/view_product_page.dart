import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/view_product/controller/view_product_controller.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/bid_price_starting.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/hstack_product_image_list.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/item_description.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/product_description.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/product_overview.dart';

class ViewProductPage extends GetWidget<ViewProductController> {
  const ViewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorExt.PRIMARY_BACKGROUND_COLOR,
      body: GetBuilder(
          init: controller,
          builder: (_) {
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                HStackProductImageList(
                  controller: controller,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // controller.isBid ? RemainingWidget() : HotSaleWidget(),
                      ProductOverView(
                        productRecord: controller.productRecord,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // BidPriceStarting(),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      ProductDescription(
                        productRecord: controller.productRecord,
                      ),
                      ItemDescription(controller: controller),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
