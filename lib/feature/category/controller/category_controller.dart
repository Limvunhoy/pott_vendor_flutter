import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool isExpanded = false;

  handleExpanded(bool isOpen) {
    isExpanded = isOpen;
    update();
  }
}
