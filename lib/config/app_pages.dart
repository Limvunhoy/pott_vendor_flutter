import 'package:get/route_manager.dart';
import 'package:pott_vendor/feature/account/binding/account_binding.dart';
import 'package:pott_vendor/feature/account/view/account_page.dart';
import 'package:pott_vendor/feature/add_menu/binding/add_menu_binding.dart';
import 'package:pott_vendor/feature/add_menu/view/add_menu_page.dart';
import 'package:pott_vendor/feature/category/binding/category_binding.dart';
import 'package:pott_vendor/feature/category/view/choose_category_page.dart';
import 'package:pott_vendor/feature/menu/binding/menu_binding.dart';
import 'package:pott_vendor/feature/menu/view/menu_page.dart';
import 'package:pott_vendor/feature/orders/binding/orders_binding.dart';
import 'package:pott_vendor/feature/orders/view/orders_page.dart';
import 'package:pott_vendor/feature/processing/binding/processing_binding.dart';
import 'package:pott_vendor/feature/processing/view/processing_page.dart';
import 'package:pott_vendor/feature/product_option/binding/product_option_binding.dart';
import 'package:pott_vendor/feature/product_option/view/product_option_page.dart';
import 'package:pott_vendor/feature/register/binding/register_binding.dart';
import 'package:pott_vendor/feature/register/view/register_page.dart';
import 'package:pott_vendor/feature/report/binding/report_binding.dart';
import 'package:pott_vendor/feature/report/view/report_page.dart';
import 'package:pott_vendor/feature/sale_menu/binding/sale_menu_binding.dart';
import 'package:pott_vendor/feature/sale_menu/view/sale_menu_page.dart';
import 'package:pott_vendor/feature/sign_in/binding/auth_binding.dart';
import 'package:pott_vendor/feature/validation/binding/verification_code_binding.dart';
import 'package:pott_vendor/feature/validation/view/verification_code_page.dart';
import 'package:pott_vendor/feature/view_product/binding/view_product_binding.dart';
import 'package:pott_vendor/feature/view_product/view/view_product_page.dart';

import '../utils/export.dart';

class AppPages {
  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: Routes.MENU,
      page: () => MenuPage(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SignInPage(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.VALIDATION,
        page: () => VerificationCodePage(),
        binding: VerificationCodeBinding()),
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
      name: Routes.ADD_MENU,
      page: () => AddMenuPage(),
      binding: AddMenuBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => AccountPage(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_OPTION,
      page: () => ProductOptionPage(),
      binding: ProductOptionBinding(),
    ),
    GetPage(
      name: Routes.REPORT,
      page: () => ReportPage(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: Routes.CHOOSE_CATEGORY,
      page: () => ChooseCategoryPage(),
      binding: CategoryBinding(),
    ),
  ];
}
