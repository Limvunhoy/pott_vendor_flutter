import 'package:flutter/material.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({Key? key, required this.ordersController})
      : super(key: key);

  final OrdersController ordersController;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        await ordersController.handlePullRefresh(OrderEnum.finishedOrder);
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
              itemCount: ordersController.getFinishedOrderCount(),
              itemBuilder: (context, index) {
                return NewItem(
                  orderStatus: OrderStatus.finished,
                  onConfirm: () {},
                  orderRecord: ordersController.finishedOrderRecords[index],
                  orderEnum: OrderEnum.finishedOrder,
                  orderTotal: "",
                );
              },
            ),
    );
  }
}
