import 'package:get/get.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';

class AddMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMenuController());
  }
}
