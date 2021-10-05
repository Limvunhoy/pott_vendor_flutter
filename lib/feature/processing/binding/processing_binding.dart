import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/controller/processing_controller.dart';

class ProcessingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProcessingController());
  }
}
