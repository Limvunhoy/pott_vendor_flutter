import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/widgets/empty_new_orders_widget.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/utils/common/alert_popup.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key, required this.ordersController}) : super(key: key);

  final OrdersController ordersController;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        await ordersController.handlePullRefresh(OrderType.newOrder);
      },
      child: ordersController.fetchStatus == FetchStatus.loading
          ? Container(
              height: MediaQuery.of(context).size.height / 1.2,
              alignment: Alignment.center,
              child: LoadingWidget())
          : ordersController.fetchStatus == FetchStatus.error
              ? Center(child: EmptyNewOrdersWidget())
              : ListView.builder(
                  key: PageStorageKey("newOrderList"),
                  controller: ordersController.scrollController,
                  // shrinkWrap: true,
                  // primary: false,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: ordersController.getNewOrderCount(),
                  itemBuilder: (context, index) {
                    return NewItem(
                      orderStatus: OrderStatus.newOrder,
                      onConfirm: () async {
                        // Get.toNamed(Routes.PROCESSING);
                        await ordersController
                            .confirmNewOrder(
                                ordersController.newOrderRecords[index].id)
                            .then((isSuccess) {
                          if (isSuccess) {
                            ordersController.handleUpdateNewOrderItem(index);
                          }
                        });
                      },
                      onReject: () {
                        AppDialog.showAppDialog(context,
                            title: "Are you sure?",
                            subtitle: "You want to reject delivery?",
                            onClose: () {
                          Get.back();
                        }, onConfirm: () {
                          // TODO: Handle reject order
                        });
                      },
                      onGoToOrderDetail: () {
                        Get.toNamed(Routes.PROCESSING,
                            arguments: ordersController.newOrderRecords[index]);
                      },
                      orderRecord: ordersController.newOrderRecords[index],
                      orderEnum: OrderType.newOrder,
                      orderTotal: ordersController.calculateOrderTotal(index),
                    );
                  },
                ),
    );
  }
}
