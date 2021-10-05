import 'package:get/get.dart';

class SaleMenuController extends GetxController {
  RxBool isOn = false.obs;

  handleSwitch() {
    isOn.toggle();
  }

  switchOn() {
    isOn.toggle();
  }

  switchOff() {
    isOn.toggle();
  }
}
