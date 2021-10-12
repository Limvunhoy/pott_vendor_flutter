import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/sale_menu/view/widgets/bid_prodcut_item.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';

class BidProductPage extends StatelessWidget {
  const BidProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {},
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 5,
          itemBuilder: (context, index) {
            return BidProductItem(
              onItemTapped: () {
                Get.toNamed(Routes.VIEW_PRODUCT);
              },
            );
          }),
    );
  }
}
