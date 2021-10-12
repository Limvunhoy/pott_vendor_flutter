import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/orders/view/widgets/empty_new_orders_widget.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: EmptyNewOrdersWidget(),
    // );

    return RefreshWidget(
      onRefresh: () async {
        print("Refreshing");
      },
      child: ListView.builder(
        key: PageStorageKey("newOrderList"),
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (context, index) {
          return NewItem(
            orderStatus: OrderStatus.newOrder,
            onConfirm: () {
              Get.toNamed(Routes.PROCESSING);
            },
          );
        },
      ),
    );
  }
}
