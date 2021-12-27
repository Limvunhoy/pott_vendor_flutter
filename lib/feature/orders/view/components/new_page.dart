import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/widgets/empty_new_orders_widget.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key, required this.ordersController}) : super(key: key);

  final OrdersController ordersController;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        print("Refreshing");
      },
      child: ordersController.fetchStatus == FetchStatus.loading
          ? LoadingWidget()
          : ListView.builder(
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
