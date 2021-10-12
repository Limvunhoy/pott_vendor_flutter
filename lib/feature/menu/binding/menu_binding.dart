import 'package:get/get.dart';
import 'package:pott_vendor/feature/menu/controller/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuController());
  }
}
