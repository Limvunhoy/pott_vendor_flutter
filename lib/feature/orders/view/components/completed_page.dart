import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/widgets/completed_order_item.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key, required this.ordersController})
      : super(key: key);

  final OrdersController ordersController;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        await ordersController.handlePullRefresh(OrderType.completedOrder);
      },
      child: ordersController.fetchStatus == FetchStatus.loading
          ? Container(
              height: MediaQuery.of(context).size.height / 1.2,
              alignment: Alignment.center,
              child: LoadingWidget())
          : ListView.builder(
              key: PageStorageKey("readyOrderList"),
              shrinkWrap: true,
              primary: false,
              itemCount: ordersController.getCompletedOrderCount(),
              itemBuilder: (context, index) {
                return CompletedOrderItem(
                  orderRecordResponse:
                      ordersController.completedOrderRecords[index],
                  item: ordersController.getCompletedItem(index),
                );
              },
            ),
    );
  }
}
