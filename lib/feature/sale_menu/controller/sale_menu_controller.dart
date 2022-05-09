import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/constants/app_constants.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class SaleMenuController extends GetxController
    with SingleGetTickerProviderMixin {
  RxBool isOn = false.obs;
  late TabController tabController;
  late ScrollController scrollController;
  FetchStatus fetchStatus = FetchStatus.idle;

  ProductService _service = ProductService();

  handleSwitch() {
    isOn.toggle();
  }

  switchOn() {
    isOn.toggle();
  }

  switchOff() {
    isOn.toggle();
  }

  final args = Get.arguments;

  late bool isProductCreated;

  List<ProductRecord> saleProductRecords = [];
  List<ProductRecord> bidProductRecords = [];

  int salePage = 1;
  int bidPage = 1;

  bool isLoadMoreSale = false;
  bool isLoadMoreBid = false;

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          handleTabBarChanged(tabController.index);
        }
      });

    if (args != null && args is bool) {
      isProductCreated = args;
      if (isProductCreated) {
        await handlePullRefresh(ProductType.sell);
      }
    }

    await queryProduct("sell", salePage, isLoadMoreSale, saleProductRecords);
    toggleSwitch();

    scrollController = ScrollController()..addListener(handleFetchMoreProduct);

    super.onInit();
  }

  int getSaleCount() {
    return saleProductRecords.length;
  }

  int getBidCount() {
    return bidProductRecords.length;
  }

  toggleSwitch() {
    saleProductRecords.map((e) {
      if (e.status == "true") {
        isOn.value = true;
      } else {
        isOn.value = false;
      }
    }).toList();
  }

  handleTesting() async {
    // update();
    await Future.delayed(Duration(seconds: 3));
  }

  Future handleUpdateProductStatus(int index) async {
    var status = "";

    if (saleProductRecords[index].status == "true") {
      status = "false";
    } else {
      status = "true";
    }

    try {
      var res = await _service.updateProductStatus(
          saleProductRecords[index].id, status);
      if (res != null) {
        saleProductRecords[index].status = res;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e", gravity: ToastGravity.BOTTOM);
    }
  }

  queryProduct(
      String type, int page, bool isLoadMore, List<ProductRecord> records,
      {bool isPullRefresh = false, bool isLoading = true}) async {
    if (isLoading) {
      fetchStatus = FetchStatus.loading;
      update();
    }

    try {
      // if (isPullRefresh) {
      //   page = 1;
      //   // records.clear();
      // }

      final response = await _service.queryProduct(type, page);
      fetchStatus = FetchStatus.complete;

      if (response != null) {
        if (response.records.length == fetchProductLimit) {
          isLoadMore = true;

          if (page < response.totalNumPage) {
            page += 1;
          }
        } else {
          isLoadMore = false;
        }

        if (isPullRefresh) {
          records = response.records;
        } else {
          records.addAll(response.records);
        }
      }

      update();
      // return records;
    } catch (e) {
      print("Failed to Get Product $e");
      fetchStatus = FetchStatus.error;
      update();
      // return [];
    }
  }

  handlePullRefresh(ProductType type) async {
    switch (type) {
      case ProductType.sell:
        salePage = 1;
        await queryProduct("sell", salePage, isLoadMoreSale, saleProductRecords,
            isPullRefresh: true, isLoading: false);
        break;
      case ProductType.bid:
        bidPage = 1;
        await queryProduct("bid", bidPage, isLoadMoreBid, bidProductRecords,
            isPullRefresh: true, isLoading: false);
        break;
    }
  }

  String saleProductPriceFormat(int index) {
    return "\$${saleProductRecords[index].salePrice}";
  }

  // String saleProductImage(int index) {
  //   return "${saleProductRecords[index].image}";
  // }
}

extension on SaleMenuController {
  void handleTabBarChanged(int index) async {
    switch (index) {
      case 0:
        print("Sale Product Tab");
        if (saleProductRecords.isEmpty) {
          await queryProduct(
              "sell", salePage, isLoadMoreSale, saleProductRecords);
        }
        break;
      case 1:
        print("Bid Product Tab");
        if (bidProductRecords.isEmpty) {
          await queryProduct("bid", bidPage, isLoadMoreBid, bidProductRecords);
        }
        break;
    }
  }

  handleFetchMoreProduct() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      switch (tabController.index) {
        case 0:
          if (isLoadMoreSale) {
            await queryProduct(
                "sell", salePage, isLoadMoreSale, saleProductRecords,
                isLoading: false);
          }
          break;
        case 1:
          if (isLoadMoreBid) {
            await queryProduct("bid", bidPage, isLoadMoreBid, bidProductRecords,
                isLoading: false);
          }
          break;
      }
    }
  }
}
