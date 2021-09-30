import 'package:get/route_manager.dart';
import 'package:pott_vendor/feature/menu/binding/menu_binding.dart';
import 'package:pott_vendor/feature/menu/view/menu_page.dart';

import 'export.dart';

class AppPages {
  static const INITIAL = Routes.MENU;

  static final routes = [
    GetPage(name: Routes.SIGNIN, page: () => SignInPage()),
    GetPage(name: Routes.MENU, page: () => MenuPage(), binding: MenuBinding()),
  ];
}
