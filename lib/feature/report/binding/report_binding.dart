import 'package:get/get.dart';
import 'package:pott_vendor/feature/report/controller/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }
}
