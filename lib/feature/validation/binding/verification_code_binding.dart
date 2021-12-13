import 'package:get/get.dart';
import 'package:pott_vendor/feature/validation/controller/verification_code_controller.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationCodeController());
  }
}
