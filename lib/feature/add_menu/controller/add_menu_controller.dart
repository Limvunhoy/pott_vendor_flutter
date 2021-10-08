import 'package:get/get.dart';

class AddMenuController extends GetxController {
  RxString enteredText = "".obs;

  counterText(String text) {
    enteredText.value = text;
  }
}
