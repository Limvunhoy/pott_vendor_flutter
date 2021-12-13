import 'dart:async';

import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  late Timer _timer;
  int countdownTime = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countdownTime == 0) {
          timer.cancel();
        } else {
          countdownTime--;
        }
        update();
      },
    );
  }

  String? validateVerifyCode(String? lastname) {
    if (lastname!.isEmpty) {
      return "Pelease verification code.";
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
