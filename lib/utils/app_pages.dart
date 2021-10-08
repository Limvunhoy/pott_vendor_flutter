import 'package:get/route_manager.dart';
import 'package:pott_vendor/feature/account/binding/account_binding.dart';
import 'package:pott_vendor/feature/account/view/account_page.dart';
import 'package:pott_vendor/feature/menu/binding/menu_binding.dart';
import 'package:pott_vendor/feature/menu/view/menu_page.dart';
import 'package:pott_vendor/feature/orders/binding/orders_binding.dart';
import 'package:pott_vendor/feature/orders/view/orders_page.dart';
import 'package:pott_vendor/feature/processing/binding/processing_binding.dart';
import 'package:pott_vendor/feature/processing/view/processing_page.dart';
import 'package:pott_vendor/feature/sale_menu/binding/sale_menu_binding.dart';
import 'package:pott_vendor/feature/sale_menu/view/sale_menu_page.dart';
import 'package:pott_vendor/feature/sign_in/binding/sign_in_binding.dart';
import 'package:pott_vendor/feature/view_product/binding/view_product_binding.dart';
import 'package:pott_vendor/feature/view_product/view/view_product_page.dart';

import 'export.dart';

class AppPages {
  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
        name: Routes.SIGNIN,
        page: () => SignInPage(),
        binding: SignInBinding()),
    GetPage(name: Routes.MENU, page: () => MenuPage(), binding: MenuBinding()),
    GetPage(name: Routes.NOTIFICATION, page: () => NotificationPage()),
    GetPage(
        name: Routes.ORDERS,
        page: () => OrdersPage(),
        binding: OrdersBinding()),
    GetPage(
        name: Routes.SALE_MENU,
        page: () => SaleMenuScreen(),
        binding: SaleMenuBinding()),
    GetPage(
        name: Routes.PROCESSING,
        page: () => ProcessingPage(),
        binding: ProcessingBinding()),
    GetPage(
      name: Routes.VIEW_PRODUCT,
      page: () => ViewProductPage(),
      binding: ViewProductBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => AccountPage(),
      binding: AccountBinding(),
    ),
  ];
}
