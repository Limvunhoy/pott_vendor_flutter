import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/core/service/order/order_service.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class OrderTabs {
  final String title;

  const OrderTabs(this.title);
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

  OrderDataResponse? orderDataResponse;

  FetchStatus fetchStatus = FetchStatus.idle;

  String vendorId = "15";

  @override
  void onInit() {
    super.onInit();

    getOrder("new");

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
  getOrder(String status) async {
    fetchStatus = FetchStatus.loading;
    try {
      orderDataResponse = await _orderService.getQueryOrder(vendorId, status);
      fetchStatus = FetchStatus.complete;
      update();
    } catch (e) {
      print("Failed to get order $e");
    }
  }
}

// MARK: Handle Tab Bar Changed
extension on OrdersController {
  void handleTabBarChange(int index) {
    switch (tabController.index) {
      case 0:
        print("Current TabBar: New");
        break;
      case 1:
        print("Current TabBar: Ready");
        break;
      case 2:
        print("Current TabBar: Finished");
        break;
      case 3:
        print("Current TabBar: Completed");
        break;
    }
  }
}
