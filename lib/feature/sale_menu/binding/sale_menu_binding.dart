import 'package:get/get.dart';
import 'package:pott_vendor/feature/sale_menu/controller/sale_menu_controller.dart';

class SaleMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SaleMenuController>(SaleMenuController());
  }
}
