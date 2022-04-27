import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/core/service/order/order_service.dart';
import 'package:pott_vendor/utils/constants/app_constants.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class OrderTabs {
  final String title;

  const OrderTabs(this.title);
}

enum OrderType {
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

  List<OrderRecordResponse> newOrderRecords = [];
  List<OrderRecordResponse> confirmOrderRecords = [];
  List<OrderRecordResponse> finishedOrderRecords = [];
  List<OrderRecordResponse> completedOrderRecords = [];

  FetchStatus newOrderFetchStatus = FetchStatus.idle;
  FetchStatus confirmOrderFetchStatus = FetchStatus.idle;
  FetchStatus finishedOrderFetchStatus = FetchStatus.idle;
  FetchStatus completedOrderFetchStatus = FetchStatus.idle;

  String vendorId = "22";

  late ScrollController scrollController;

  RxBool isMoreNewOrder = false.obs;
  RxBool isMoreConfirmOrder = false.obs;
  RxBool isMoreFinishedOrder = false.obs;
  RxBool isMoreCompletedOrder = false.obs;

  RxInt newOrderPage = 1.obs;
  RxInt confirmOrderPage = 1.obs;
  RxInt finishedOrderPage = 1.obs;
  RxInt completedOrderPage = 1.obs;

  @override
  void onInit() async {
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          handleTabBarChange(tabController.index);
        }
      });

    scrollController = ScrollController()..addListener(_fetchMoreOrder);

    await fetchNewOrder();

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  late OrderRecordResponse orderDetail;

  getOrderDetail(String id) async {
    try {
      final response = await _orderService.getOrderDetail(id);
      if (response != null) {
        orderDetail = response;
        update();
      }
    } catch (e) {}
  }

  Future<bool> confirmNewOrder(String id) async {
    try {
      final response = await _orderService.updateOrderStatus(id, "confirm");

      return response;
    } catch (e) {
      Get.snackbar("Something went wrong!", e.toString());
      return false;
    }
  }

  Future<bool> updateReadyOrder(String id) async {
    try {
      final response = await _orderService.updateOrderStatus(id, "ready");

      return response;
    } catch (e) {
      Get.snackbar("Something went wrong!", e.toString());
      return false;
    }
  }

  handleUpdateNewOrderItem(int index) {
    newOrderRecords.removeAt(index);
    if (confirmOrderRecords.isNotEmpty) {
      confirmOrderRecords.insert(0, newOrderRecords[index]);
    }

    Fluttertoast.showToast(
        msg: "Order Confirmed",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
    update();
  }

  handleUpdateReadyOrderItem(int index) {
    confirmOrderRecords.removeAt(index);
    if (finishedOrderRecords.isNotEmpty) {
      finishedOrderRecords.insert(0, confirmOrderRecords[index]);
    }
    Fluttertoast.showToast(
      msg: "Order Ready",
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
    update();
  }

  handlePullRefresh(OrderType orderStatus) async {
    switch (orderStatus) {
      case OrderType.newOrder:
        await fetchNewOrder(isPullRefresh: true, isLoading: false);
        break;
      case OrderType.readyOrder:
        await fetchReadyOrder(isPullRefresh: true, isLoading: false);
        break;
      case OrderType.finishedOrder:
        await fetchFinishedOrder(isPullRefresh: true, isLoading: false);
        break;
      case OrderType.completedOrder:
        await fetchCompletedOrder(isPullRefresh: true, isLoading: false);
        break;
    }
  }

  int getNewOrderCount() {
    return newOrderRecords.length;
  }

  int getReadyOrderCount() {
    return confirmOrderRecords.length;
  }

  int getFinishedOrderCount() {
    return finishedOrderRecords.length;
  }

  int getCompletedOrderCount() {
    return completedOrderRecords.length;
  }

  String calculateOrderTotal(int index) {
    int orderTotal = newOrderRecords[index].totalPrice +
        (newOrderRecords[index].delivery?.amount ?? 0);
    return "$orderTotal";
  }

  String getCompletedItem(int index) {
    String item = "";
    if (completedOrderRecords[index].totalQty <= 1) {
      item = "${completedOrderRecords[index].totalQty} Item";
    } else {
      item = "${completedOrderRecords[index].totalQty} Items";
    }
    return item;
  }

  // MARK: Fetch More Order
  void _fetchMoreOrder() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print("isMoreNewRecord ${isMoreNewOrder.value}");
      switch (tabController.index) {
        case 0:
          if (isMoreNewOrder.isTrue) {
            print("Load More New Order");
            await fetchNewOrder(isLoading: false);
          }
          break;
        case 1:
          if (isMoreConfirmOrder.isTrue) {
            print("Load More Ready Order");
            await fetchReadyOrder(isLoading: false);
          }
          break;
        case 3:
          if (isMoreFinishedOrder.isTrue) {
            print("Load More Finished Order");
            await fetchFinishedOrder(isLoading: false);
          }
          break;
        case 4:
          if (isMoreCompletedOrder.isTrue) {
            print("Load More Completed Order");
            await fetchCompletedOrder(isLoading: false);
          }
          break;
      }
    }
  }
}

// MARK: Handle Tab Bar Changed
extension on OrdersController {
  void handleTabBarChange(int index) async {
    switch (tabController.index) {
      case 0:
        print("Current TabBar: New");
        if (newOrderRecords.isEmpty) {
          await fetchNewOrder();
        }
        break;
      case 1:
        print("Current TabBar: Ready");
        if (confirmOrderRecords.isEmpty) {
          await fetchReadyOrder();
        }
        break;
      case 2:
        print("Current TabBar: Finished: ${finishedOrderRecords.length}");
        if (finishedOrderRecords.isEmpty) {
          await fetchFinishedOrder();
        }
        break;
      case 3:
        print("Current TabBar: Completed");
        if (completedOrderRecords.isEmpty) {
          await fetchCompletedOrder();
        }
        break;
    }
  }
}

// MARK: Fetch Order Records
extension on OrdersController {
  fetchNewOrder({bool isPullRefresh = false, bool isLoading = true}) async {
    debugPrint("Fetching Data ...");
    if (isLoading) {
      newOrderFetchStatus = FetchStatus.loading;
      update();
    }

    try {
      if (isPullRefresh) {
        newOrderPage.value = 1;
        newOrderRecords.clear();
      }

      final response = await _orderService.getQueryOrder(
          vendorId, newOrderType, newOrderPage);
      newOrderFetchStatus = FetchStatus.complete;

      if (response != null) {
        if (response.records.length == fetchLimit) {
          isMoreNewOrder.value = true;

          if (newOrderPage.value < response.totalNumPage) {
            newOrderPage.value += 1;
          }
        } else {
          isMoreNewOrder.value = false;
        }

        newOrderRecords.addAll(response.records);
      }
      update();
    } catch (e) {
      newOrderFetchStatus = FetchStatus.error;
      update();
    }
  }

  fetchReadyOrder({bool isPullRefresh = false, bool isLoading = true}) async {
    debugPrint("Fetching Data ...");
    if (isLoading) {
      confirmOrderFetchStatus = FetchStatus.loading;
      update();
    }

    try {
      if (isPullRefresh) {
        confirmOrderPage.value = 1;
        confirmOrderRecords.clear();
      }

      final response = await _orderService.getQueryOrder(
          vendorId, confirmOrderType, confirmOrderPage);
      confirmOrderFetchStatus = FetchStatus.complete;

      if (response != null) {
        if (response.records.length == fetchLimit) {
          isMoreConfirmOrder.value = true;

          if (confirmOrderPage.value < response.totalNumPage) {
            confirmOrderPage.value += 1;
          }
        } else {
          isMoreConfirmOrder.value = false;
        }

        confirmOrderRecords.addAll(response.records);
      }
      update();
    } catch (e) {
      confirmOrderFetchStatus = FetchStatus.error;
      update();
    }
  }

  fetchFinishedOrder(
      {bool isPullRefresh = false, bool isLoading = true}) async {
    debugPrint("Fetching Data ...");
    if (isLoading) {
      finishedOrderFetchStatus = FetchStatus.loading;
      update();
    }

    try {
      if (isPullRefresh) {
        finishedOrderPage.value = 1;
        finishedOrderRecords.clear();
      }

      final response = await _orderService.getQueryOrder(
          vendorId, finishedOrderType, finishedOrderPage);
      finishedOrderFetchStatus = FetchStatus.complete;

      if (response != null) {
        if (response.records.length == fetchLimit) {
          isMoreFinishedOrder.value = true;

          if (finishedOrderPage.value < response.totalNumPage) {
            finishedOrderPage.value += 1;
          }
        } else {
          isMoreFinishedOrder.value = false;
        }

        finishedOrderRecords.addAll(response.records);
      }
      update();
    } catch (e) {
      finishedOrderFetchStatus = FetchStatus.error;
      update();
    }
  }

  fetchCompletedOrder(
      {bool isPullRefresh = false, bool isLoading = true}) async {
    debugPrint("Fetching Data ...");
    if (isLoading) {
      completedOrderFetchStatus = FetchStatus.loading;
      update();
    }

    try {
      if (isPullRefresh) {
        completedOrderPage.value = 1;
        completedOrderRecords.clear();
      }

      final response = await _orderService.getQueryOrder(
          vendorId, completedOrderType, completedOrderPage);
      completedOrderFetchStatus = FetchStatus.complete;

      if (response != null) {
        if (response.records.length == fetchLimit) {
          isMoreCompletedOrder.value = true;

          if (completedOrderPage.value < response.totalNumPage) {
            completedOrderPage.value += 1;
          }
        } else {
          isMoreCompletedOrder.value = false;
        }

        completedOrderRecords.addAll(response.records);
      }
      update();
    } catch (e) {
      completedOrderFetchStatus = FetchStatus.error;
      update();
    }
  }
}
