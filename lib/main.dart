import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/service/api_base_helper.dart';
import 'package:pott_vendor/utils/app_pages.dart';
import 'package:pott_vendor/utils/app_routes.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

void main() {
  Get.put<ApiBaseHelper>(ApiBaseHelper());
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
      initialRoute: Routes.ACCOUNT,
    );
  }
}
