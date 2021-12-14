import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/config/app_pages.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/feature/account/binding/account_binding.dart';
import 'package:pott_vendor/feature/sign_in/controller/auth_controller.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

void main() {
  Get.put<ApiBaseHelper>(ApiBaseHelper());
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wing Map',
      theme: ThemeData(
        primaryColor: colorExt.PRIMARY_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.MENU,
    );
  }
}
