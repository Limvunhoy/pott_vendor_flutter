import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/config/app_pages.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/feature/sign_in/controller/auth_controller.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

final authController = Get.put(AuthController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<ApiBaseHelper>(ApiBaseHelper());
  await authController.readUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      title: 'PottVendor',
      unknownRoute: GetPage(
        name: "/unknown",
        page: () => Scaffold(
          backgroundColor: Colors.red,
        ),
      ),
      theme: ThemeData(
        primaryColor: colorExt.PRIMARY_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialBinding: AuthBinding(),
      getPages: AppPages.routes,
      initialRoute: authController.isAuthentication.isTrue
          ? Routes.ADD_MENU
          : Routes.SIGNIN,
    );
  }
}
