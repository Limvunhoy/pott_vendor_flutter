import 'package:get/get.dart';
import 'package:pott_vendor/feature/product_option/controller/product_option_controller.dart';

class ProductOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductOptionController());
  }
}
