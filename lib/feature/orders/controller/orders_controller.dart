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
    const OrderTabs("Complted"),
  ];

  late TabController tabController;
  OrderService _orderService = OrderService();

  OrderDataResponse? newOrderRecord;
  OrderDataResponse? readyOrderRecord;
  OrderDataResponse? finishedOrderRecord;
  OrderDataResponse? completedOrderRecord;

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
}

// MARK: Services
extension on OrdersController {
  getOrder(String status, OrderEnum orderEnum) async {
    fetchStatus = FetchStatus.loading;
    update();

    try {
      OrderDataResponse? orderResponse =
          await _orderService.getQueryOrder(vendorId, status);
      fetchStatus = FetchStatus.complete;

      switch (orderEnum) {
        case OrderEnum.newOrder:
          newOrderRecord = orderResponse;
          update();
          break;
        case OrderEnum.readyOrder:
          readyOrderRecord = orderResponse;
          update();
          break;
        case OrderEnum.finishedOrder:
          finishedOrderRecord = orderResponse;
          update();
          break;
        case OrderEnum.completedOrder:
          completedOrderRecord = orderResponse;
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
