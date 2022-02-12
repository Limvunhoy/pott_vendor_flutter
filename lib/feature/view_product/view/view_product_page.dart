import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/view_product/controller/view_product_controller.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/bid_price_starting.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/hot_sale_widget.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/hstack_product_image_list.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/item_description.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/product_description.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/product_overview.dart';
import 'package:pott_vendor/feature/view_product/view/widgets/remaining_widget.dart';

class ViewProductPage extends StatelessWidget {
  const ViewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ViewProductController>();

    return Scaffold(
      backgroundColor: colorExt.PRIMARY_BACKGROUND_COLOR,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          HStackProductImageList(
            controller: _controller,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // RemainingWidget(),
                // HotSaleWidget(),
                ProductOverView(),
                const SizedBox(
                  height: 10.0,
                ),
                // BidPriceStarting(),
                // const SizedBox(
                //   height: 10.0,
                // ),
                ProductDescription(),
                ItemDescription(controller: _controller),
              ],
            ),
          )
        ],
      ),
    );
  }
}
