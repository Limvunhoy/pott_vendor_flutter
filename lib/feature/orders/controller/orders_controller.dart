import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/core/service/order/order_service.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class OrderTabs {
  final String title;

  const OrderTabs(this.title);
}

enum OrderEnum {
  newOrder,
  readyOrder,
  finishedOrder,
  completedOrder,
}

class OrdersController extends GetxController
    with SingleGetTickerProviderMixin {
  List<OrderTabs> orderTabs = const <OrderTabs>[
    const OrderTabs("New"),
    const OrderTabs("Ready"),
    const OrderTabs("Finished"),
    const OrderTabs("Completed"),
  ];

  late TabController tabController;
  OrderService _orderService = OrderService();

  OrderDataResponse? newOrderRecord;
  List<OrderRecordResponse> newOrderRecords = [];

  OrderDataResponse? readyOrderRecord;
  List<OrderRecordResponse> readyOrderRecords = [];

  OrderDataResponse? finishedOrderRecord;
  List<OrderRecordResponse> finishedOrderRecords = [];

  OrderDataResponse? completedOrderRecord;
  List<OrderRecordResponse> completedRecords = [];

  FetchStatus fetchStatus = FetchStatus.idle;

  String vendorId = "15";

  @override
  void onInit() {
    super.onInit();

    getOrder("new", OrderEnum.newOrder);

    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          handleTabBarChange(tabController.index);
        }
      });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  handlePullRefresh(OrderEnum orderStatus) {
    switch (orderStatus) {
      case OrderEnum.newOrder:
        pullRefresh("new", orderStatus);
        break;
      case OrderEnum.readyOrder:
        pullRefresh("ready", orderStatus);
        break;
      case OrderEnum.finishedOrder:
        pullRefresh("confirm", orderStatus);
        break;
      case OrderEnum.completedOrder:
        pullRefresh("completed", orderStatus);
        break;
    }
  }

  int getNewOrderCount() {
    return newOrderRecords.length;
  }

  int getReadyOrderCount() {
    return readyOrderRecords.length;
  }

  int getFinishedOrderCount() {
    return finishedOrderRecords.length;
  }

  int getCompletedOrderCount() {
    return completedRecords.length;
  }

  String calculateOrderTotal(int index) {
    int orderTotal = newOrderRecords[index].totalPrice +
        (newOrderRecords[index].delivery?.amount ?? 0);
    return "$orderTotal";
  }

  String getCompletedItem(int index) {
    String item = "";
    if (completedRecords[index].totalQty <= 1) {
      item = "${completedRecords[index].totalQty} Item";
    } else {
      item = "${completedRecords[index].totalQty} Items";
    }
    return item;
  }
}

extension on OrdersController {
  void pullRefresh(String query, OrderEnum orderEnum) {
    Future.delayed(Duration(milliseconds: 500), () async {
      await getOrder(query, orderEnum, isPullRefresh: true);
    });
  }
}

// MARK: Services
extension on OrdersController {
  getOrder(String status, OrderEnum orderEnum,
      {bool isPullRefresh = false}) async {
    if (!isPullRefresh) {
      fetchStatus = FetchStatus.loading;
      update();
    }

    try {
      OrderDataResponse? orderResponse =
          await _orderService.getQueryOrder(vendorId, status);
      fetchStatus = FetchStatus.complete;

      switch (orderEnum) {
        case OrderEnum.newOrder:
          if (orderResponse != null) {
            newOrderRecord = orderResponse;

            if (isPullRefresh) {
              newOrderRecords = orderResponse.records;
            } else {
              newOrderRecords.addAll(orderResponse.records);
            }
          }

          update();
          break;
        case OrderEnum.readyOrder:
          if (orderResponse != null) {
            readyOrderRecord = orderResponse;
            if (isPullRefresh) {
              readyOrderRecords = readyOrderRecord?.records ?? [];
            } else {
              readyOrderRecords.addAll(readyOrderRecord?.records ?? []);
            }
          }
          update();
          break;
        case OrderEnum.finishedOrder:
          if (orderResponse != null) {
            finishedOrderRecord = orderResponse;
            if (isPullRefresh) {
              finishedOrderRecords = finishedOrderRecord?.records ?? [];
            } else {
              finishedOrderRecords.addAll(finishedOrderRecord?.records ?? []);
            }
          }

          update();
          break;
        case OrderEnum.completedOrder:
          if (orderResponse != null) {
            completedOrderRecord = orderResponse;
            if (isPullRefresh) {
              completedRecords = completedOrderRecord?.records ?? [];
            } else {
              completedRecords.addAll(completedOrderRecord?.records ?? []);
            }
          }

          update();
          break;
      }
    } catch (e) {
      print("Failed to get order $e");
    }
  }
}

// MARK: Handle Tab Bar Changed
extension on OrdersController {
  void handleTabBarChange(int index) async {
    switch (tabController.index) {
      case 0:
        print("Current TabBar: New");
        break;
      case 1:
        print("Current TabBar: Ready");
        if (readyOrderRecord == null) {
          await getOrder("ready", OrderEnum.readyOrder);
        }
        break;
      case 2:
        print("Current TabBar: Finished");
        if (finishedOrderRecord == null) {
          await getOrder("confirm", OrderEnum.finishedOrder);
        }
        break;
      case 3:
        print("Current TabBar: Completed");
        if (completedOrderRecord == null) {
          await getOrder("completed", OrderEnum.completedOrder);
        }
        break;
    }
  }
}
