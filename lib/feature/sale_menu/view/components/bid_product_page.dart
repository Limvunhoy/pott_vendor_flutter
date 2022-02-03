import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/sale_menu/controller/sale_menu_controller.dart';
import 'package:pott_vendor/feature/sale_menu/view/widgets/bid_prodcut_item.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class BidProductPage extends StatelessWidget {
  const BidProductPage({Key? key, required this.controller}) : super(key: key);

  final SaleMenuController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        Future.delayed(Duration(milliseconds: 300), () async {
          await controller.handlePullRefresh(ProductType.bid);
        });
      },
      child: controller.fetchStatus == FetchStatus.loading
          ? Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: LoadingWidget())
          : controller.fetchStatus == FetchStatus.error
              ? Center(
                  child: BaseTitleText(
                    text: "No Data",
                    color: colorExt.PRIMARY_COLOR,
                  ),
                )
              : ListView.builder(
                  itemCount: controller.getBidCount(),
                  itemBuilder: (context, index) {
                    return BidProductItem(
                      controller: controller,
                      onItemTapped: () {
                        Get.toNamed(Routes.VIEW_PRODUCT);
                      },
                      bidProduct: controller.bidProductRecords[index],
                    );
                  }),
    );
  }
}
