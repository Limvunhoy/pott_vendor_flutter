import 'package:get/get.dart';
import 'package:pott_vendor/feature/category/controller/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
