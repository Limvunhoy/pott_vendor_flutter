import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/core/model/processing/processing_model.dart';

class ProcessingController extends GetxController {
  Rx<ProcessingModel> dummyData = ProcessingModel().obs;

  Timer? timer;

  OrderRecordResponse? orderRecordItem;

  final arg = Get.arguments;

  @override
  void onInit() {
    super.onInit();

    if (arg is OrderRecordResponse) {
      orderRecordItem = arg;
      update();
    }
  }

  String orderDate() {
    if (orderRecordItem?.timeLine.newAt != null) {
      DateTime? orderDate = orderRecordItem!.timeLine.newAt;
      String formattedDate =
          DateFormat('dd-MM-yyyy | kk:mma').format(orderDate!);

      return formattedDate;
    } else {
      return "...";
    }
  }

  ProcessingController() {
    dummyData = Rx<ProcessingModel>(ProcessingModel(
        state: ProcessingState.processing,
        title: "Processing",
        subTitle: 'Waiting Your Confirm'));
  }

  void handleConfirmOrder() {
    timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        print("Timer.tick ${timer.tick}");

        if (timer.tick == 1) {
          dummyData.value = ProcessingModel(
              state: ProcessingState.estimatedTime,
              title: "30 - 60 mins",
              subTitle: 'Estimated delivery time');
        } else if (timer.tick == 2) {
          dummyData.value = ProcessingModel(
              state: ProcessingState.estimatedTime,
              title: "30 - 60 mins",
              subTitle: 'Estimated delivery time');
        } else {
          dummyData.value = ProcessingModel(
              state: ProcessingState.delivered,
              title: "Delivered",
              subTitle: 'Order Success');
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
