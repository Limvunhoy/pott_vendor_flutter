import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/core/model/processing/processing_model.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/common/no_data_widget.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class ReadyPage extends StatelessWidget {
  const ReadyPage({Key? key, required this.ordersController}) : super(key: key);

  final OrdersController ordersController;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        await ordersController.handlePullRefresh(OrderType.readyOrder);
      },
      child: ordersController.fetchStatus == FetchStatus.loading
          ? Container(
              height: MediaQuery.of(context).size.height / 1.2,
              alignment: Alignment.center,
              child: LoadingWidget())
          : ordersController.fetchStatus == FetchStatus.error
              ? NoDataWidget(
                  title: "No Ready Order",
                )
              : ListView.builder(
                  key: PageStorageKey("readyOrderList"),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: ordersController.getReadyOrderCount(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROCESSING, arguments: {
                          "type": ProcessingState.estimatedTime,
                          "record": ordersController.confirmOrderRecords[index],
                        });
                      },
                      child: NewItem(
                        onOrderReady: () async {
                          await ordersController
                              .updateReadyOrder(ordersController
                                  .confirmOrderRecords[index].id)
                              .then((isSuccess) {
                            if (isSuccess) {
                              ordersController
                                  .handleUpdateReadyOrderItem(index);
                            }
                          });
                        },
                        orderStatus: OrderStatus.ready,
                        orderRecord:
                            ordersController.confirmOrderRecords[index],
                        orderEnum: OrderType.readyOrder,
                        orderTotal: "",
                      ),
                    );
                  },
                ),
    );
  }
}
