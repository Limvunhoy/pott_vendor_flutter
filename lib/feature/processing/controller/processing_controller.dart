import 'dart:async';

import 'package:get/get.dart';
import 'package:pott_vendor/model/processing/processing_model.dart';

class ProcessingController extends GetxController {
  Rx<ProcessingModel> dummyData = ProcessingModel().obs;

  Timer? timer;

  ProcessingController() {
    dummyData = Rx<ProcessingModel>(ProcessingModel(
        state: ProcessingState.processing,
        title: "Processing",
        subTitle: 'Waiting Your Confirm'));

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
