import 'package:get/get.dart';
import 'package:pott_vendor/feature/register/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
