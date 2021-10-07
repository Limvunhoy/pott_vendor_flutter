import 'package:get/get.dart';
import 'package:pott_vendor/feature/view_product/controller/view_product_controller.dart';

class ViewProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ViewProductController());
  }
}
