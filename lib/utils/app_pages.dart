import 'package:get/route_manager.dart';

import 'export.dart';

class AppPages {
  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(name: Routes.SIGNIN, page: () => SignInPage()),
  ];
}
