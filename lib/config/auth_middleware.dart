import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/feature/sign_in/controller/auth_controller.dart';
import 'package:pott_vendor/utils/helper/user_manager.dart';

class AuthMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();
  final UserManager userManager = UserManager();

  @override
  RouteSettings? redirect(String? route) {
    // userManager.readUser().then((value) {
    //   print("Get Value from SharedPreference $value");
    //   return value != null
    //       ? RouteSettings(name: Routes.MENU)
    //       : RouteSettings(name: Routes.SIGNIN);
    // });

    return authController.isAuthentication
        ? null
        : RouteSettings(name: Routes.SIGNIN);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return page;
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return page;
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}
