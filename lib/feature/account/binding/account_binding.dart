import 'package:get/get.dart';
import 'package:pott_vendor/feature/account/controller/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
