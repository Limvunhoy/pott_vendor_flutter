import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/core/model/processing/processing_model.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class ProcessingController extends GetxController {
  // Rx<ProcessingModel> dummyData = ProcessingModel().obs;

  // Timer? timer;

  late OrderRecordResponse orderRecordItem;

  final arg = Get.arguments;

  late ProcessingState processingState;
  ProcessingModel? processingModel;

  final OrdersController _ordersController = Get.find<OrdersController>();

  FetchStatus fetchStatus = FetchStatus.idle;

  @override
  void onInit() {
    super.onInit();

    processingState = arg["type"];
    orderRecordItem = arg["record"];
    update();

    updateProcessingState();
  }

  String orderDate() {
    if (processingModel?.state == ProcessingState.processing) {
      return newOrderDate();
    } else if (processingModel?.state == ProcessingState.estimatedTime) {
      return readyOrderDate();
    } else {
      return finishedOrderDate();
    }
  }

  String newOrderDate() {
    if (orderRecordItem.timeLine.newAt != null) {
      DateTime? orderDate = orderRecordItem.timeLine.newAt;
      String formattedDate =
          DateFormat('dd-MM-yyyy | kk:mma').format(orderDate!);

      return formattedDate;
    } else {
      return "...";
    }
  }

  String readyOrderDate() {
    if (orderRecordItem.timeLine.confirmAt != null) {
      DateTime? orderDate = orderRecordItem.timeLine.confirmAt;
      String formattedDate =
          DateFormat('dd-MM-yyyy | kk:mma').format(orderDate!);

      return formattedDate;
    } else {
      return "...";
    }
  }

  String finishedOrderDate() {
    if (orderRecordItem.timeLine.readyAt != null) {
      DateTime? orderDate = orderRecordItem.timeLine.readyAt;
      String formattedDate =
          DateFormat('dd-MM-yyyy | kk:mma').format(orderDate!);

      return formattedDate;
    } else {
      return "...";
    }
  }

  // ProcessingController() {
  //   dummyData = Rx<ProcessingModel>(ProcessingModel(
  //       state: ProcessingState.processing,
  //       title: "Processing",
  //       subTitle: 'Waiting Your Confirm'));
  // }

  updateProcessingState() {
    if (processingState == ProcessingState.processing) {
      processingModel = ProcessingModel(
          state: ProcessingState.processing,
          title: "Processing",
          subTitle: 'Waiting Your Confirm');
    } else if (processingState == ProcessingState.estimatedTime) {
      processingModel = ProcessingModel(
          state: ProcessingState.estimatedTime,
          title: "30 - 60 mins",
          subTitle: 'Estimated delivery time');
    } else {
      processingModel = ProcessingModel(
          state: ProcessingState.delivered,
          title: "Delivered",
          subTitle: 'Order Success');
    }
    update();
  }

  handleConfirmOrder() async {
    fetchStatus = FetchStatus.loading;
    await _ordersController
        .confirmNewOrder(orderRecordItem.id)
        .then((isSuccess) {
      if (isSuccess) {
        processingState = ProcessingState.estimatedTime;
        updateProcessingState();
        fetchStatus = FetchStatus.complete;
        update();

        final _index = _ordersController.newOrderRecords
            .indexWhere((element) => element.id == orderRecordItem.id);
        _ordersController.handleUpdateNewOrderItem(_index);
      }
    });
  }

  handleOrderReady() async {
    fetchStatus = FetchStatus.loading;
    await _ordersController
        .updateReadyOrder(orderRecordItem.id)
        .then((isSuccess) {
      if (isSuccess) {
        processingState = ProcessingState.delivered;
        updateProcessingState();
        fetchStatus = FetchStatus.complete;
        update();

        final _index = _ordersController.confirmOrderRecords
            .indexWhere((element) => element.id == orderRecordItem.id);
        _ordersController.handleUpdateReadyOrderItem(_index);
      }
    });
  }

  // void handleConfirmOrder() {
  //   timer = Timer.periodic(
  //     Duration(seconds: 5),
  //     (timer) {
  //       print("Timer.tick ${timer.tick}");
  //
  //       if (timer.tick == 1) {
  //         dummyData.value = ProcessingModel(
  //             state: ProcessingState.estimatedTime,
  //             title: "30 - 60 mins",
  //             subTitle: 'Estimated delivery time');
  //       } else if (timer.tick == 2) {
  //         dummyData.value = ProcessingModel(
  //             state: ProcessingState.estimatedTime,
  //             title: "30 - 60 mins",
  //             subTitle: 'Estimated delivery time');
  //       } else {
  //         dummyData.value = ProcessingModel(
  //             state: ProcessingState.delivered,
  //             title: "Delivered",
  //             subTitle: 'Order Success');
  //         timer.cancel();
  //       }
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }
}
