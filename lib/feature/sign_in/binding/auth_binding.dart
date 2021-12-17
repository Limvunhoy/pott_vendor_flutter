import 'package:get/get.dart';
import 'package:pott_vendor/feature/sign_in/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
