import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';
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

  Future<List<ProductRecord>> queryProduct(
      String type, int page, bool isLoadMore, List<ProductRecord> records,
      {bool isPullRefresh = false, bool isLoading = true}) async {
    if (isLoading) {
      fetchStatus = FetchStatus.loading;
      update();
    }

    try {
      if (isPullRefresh) {
        page = 1;
        records.clear();
      }

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

        records.addAll(response.records);
      }

      update();
      return records;
    } catch (e) {
      fetchStatus = FetchStatus.error;
      update();
      return [];
    }
  }

  handlePullRefresh(ProductType type) async {
    switch (type) {
      case ProductType.sell:
        await queryProduct("sell", salePage, isLoadMoreSale, saleProductRecords,
            isPullRefresh: true, isLoading: false);
        break;
      case ProductType.bid:
        await queryProduct("bid", bidPage, isLoadMoreBid, bidProductRecords,
            isPullRefresh: true, isLoading: false);
        break;
    }
  }

  String saleProductPriceFormat(int index) {
    return "\$${saleProductRecords[index].salePrice}";
  }

  String saleProductImage(int index) {
    return "${saleProductRecords[index].image}";
  }
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
