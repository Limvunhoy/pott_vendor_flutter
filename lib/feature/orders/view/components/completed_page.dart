import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/widgets/completed_order_item.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/no_data_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';
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
      child: ordersController.completedOrderFetchStatus == FetchStatus.loading
          ? Container(
              height: MediaQuery.of(context).size.height / 1.2,
              alignment: Alignment.center,
              child: LoadingWidget())
          : ordersController.completedOrderFetchStatus == FetchStatus.error
              ? NoDataWidget(title: "No Completed Order")
              : ListView.separated(
                  key: PageStorageKey("readyOrderList"),
                  // shrinkWrap: true,
                  // primary: false,
                  itemCount: ordersController.getCompletedOrderCount(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: appSizeExt.basePadding,
                    );
                  },
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
