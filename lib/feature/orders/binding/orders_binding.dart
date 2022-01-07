import 'package:get/instance_manager.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersController());
  }
}
