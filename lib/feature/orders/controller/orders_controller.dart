import 'package:flutter/material.dart';
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
  List<OrderRecordResponse> readyOrderRecords = [];
  List<OrderRecordResponse> finishedOrderRecords = [];
  List<OrderRecordResponse> completedOrderRecords = [];

  FetchStatus fetchStatus = FetchStatus.idle;

  String vendorId = "22";

  late ScrollController scrollController;

  RxBool isMoreNewOrder = false.obs;
  RxBool isMoreReadyOrder = false.obs;
  RxBool isMoreFinishedOrder = false.obs;
  RxBool isMoreCompletedOrder = false.obs;

  RxInt newOrderPage = 1.obs;
  RxInt readyOrderPage = 1.obs;
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

    newOrderRecords = await fetchOrder(
        newOrderType, newOrderPage, isMoreNewOrder, newOrderRecords);

    scrollController = ScrollController()..addListener(_fetchMoreOrder);

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  handlePullRefresh(OrderType orderStatus) async {
    switch (orderStatus) {
      case OrderType.newOrder:
        await fetchOrder(
            newOrderType, newOrderPage, isMoreNewOrder, newOrderRecords,
            isPullRefresh: true, isLoading: false);
        break;
      case OrderType.readyOrder:
        await fetchOrder(
            readyOrderType, readyOrderPage, isMoreReadyOrder, readyOrderRecords,
            isPullRefresh: true, isLoading: false);
        break;
      case OrderType.finishedOrder:
        await fetchOrder(confirmOrderType, finishedOrderPage,
            isMoreFinishedOrder, finishedOrderRecords,
            isPullRefresh: true, isLoading: false);
        break;
      case OrderType.completedOrder:
        await fetchOrder(completedOrderType, completedOrderPage,
            isMoreCompletedOrder, completedOrderRecords,
            isPullRefresh: true, isLoading: false);
        break;
    }
  }

  int getNewOrderCount() {
    print("New Order Count ${newOrderRecords.length}");
    return newOrderRecords.length;
  }

  int getReadyOrderCount() {
    return readyOrderRecords.length;
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
            await fetchOrder(
                newOrderType, newOrderPage, isMoreNewOrder, newOrderRecords,
                isLoading: false);
          }
          break;
        case 1:
          if (isMoreReadyOrder.isTrue) {
            print("Load More Ready Order");
            await fetchOrder(readyOrderType, readyOrderPage, isMoreReadyOrder,
                readyOrderRecords,
                isLoading: false);
          }
          break;
        case 3:
          if (isMoreFinishedOrder.isTrue) {
            print("Load More Finished Order");
            await fetchOrder(confirmOrderType, finishedOrderPage,
                isMoreFinishedOrder, finishedOrderRecords,
                isLoading: false);
          }
          break;
        case 4:
          if (isMoreCompletedOrder.isTrue) {
            print("Load More Completed Order");
            await fetchOrder(completedOrderType, completedOrderPage,
                isMoreCompletedOrder, completedOrderRecords,
                isLoading: false);
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
          await fetchOrder(
              newOrderType, newOrderPage, isMoreNewOrder, newOrderRecords);
        }
        break;
      case 1:
        print("Current TabBar: Ready");
        if (readyOrderRecords.isEmpty) {
          await fetchOrder(readyOrderType, readyOrderPage, isMoreReadyOrder,
              readyOrderRecords);
        }
        break;
      case 2:
        print("Current TabBar: Finished");
        if (finishedOrderRecords.isEmpty) {
          await fetchOrder(confirmOrderType, finishedOrderPage,
              isMoreFinishedOrder, finishedOrderRecords);
        }
        break;
      case 3:
        print("Current TabBar: Completed");
        if (completedOrderRecords.isEmpty) {
          await fetchOrder(completedOrderType, completedOrderPage,
              isMoreCompletedOrder, completedOrderRecords);
        }
        break;
    }
  }
}

// MARK: Fetch Order Records
extension on OrdersController {
  Future<List<OrderRecordResponse>> fetchOrder(String status, RxInt page,
      RxBool isLoadMore, List<OrderRecordResponse> records,
      {bool isPullRefresh = false, bool isLoading = true}) async {
    if (isLoading) {
      fetchStatus = FetchStatus.loading;
      update();
    }

    try {
      if (isPullRefresh) {
        page.value = 1;
      }

      final response =
          await _orderService.getQueryOrder(vendorId, status, page);
      fetchStatus = FetchStatus.complete;

      if (response != null) {
        if (response.records.length == fetchLimit) {
          isLoadMore.value = true;

          if (page.value < response.totalNumPage) {
            page.value += 1;
          }

          if (isPullRefresh) {
            records.clear();
          }
        } else {
          isLoadMore.value = false;
        }
        records.addAll(response.records);
      }
      update();
      return records;
    } catch (e) {
      fetchStatus = FetchStatus.complete;
      update();
      return [];
    }
  }
}
