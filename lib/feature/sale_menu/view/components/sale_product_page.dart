import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';
import 'package:pott_vendor/feature/sale_menu/controller/sale_menu_controller.dart';
import 'package:pott_vendor/feature/sale_menu/view/widgets/sale_product_item.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class SaleProductPage extends StatelessWidget {
  const SaleProductPage({Key? key, required this.controller}) : super(key: key);

  final SaleMenuController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        Future.delayed(Duration(milliseconds: 300), () async {
          await controller.handlePullRefresh(ProductType.sell);
        });
      },
      child: controller.fetchStatus == FetchStatus.loading
          ? Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: LoadingWidget())
          : ListView.builder(
              // shrinkWrap: true,
              // primary: false,
              itemCount: controller.getSaleCount(),
              itemBuilder: (context, index) {
                return SaleProductItem(
                  controller: controller,
                  onItemTapped: () {
                    Get.toNamed(Routes.VIEW_PRODUCT);
                  },
                  saleProduct: controller.saleProductRecords[index],
                  onToggleSwitch: () {
                    controller.updateProductStatus(index);
                  },
                );
              },
            ),
    );
  }
}
