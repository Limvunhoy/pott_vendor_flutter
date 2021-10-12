import 'package:get/get.dart';
import 'package:pott_vendor/core/model/menu/menu_item_model.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';

class MenuController extends GetxController {
  List<MenuItemModel> menuItemList = [
    MenuItemModel(
        icon: AssetPath.MENU_ORDER_ICON,
        title: "Orders",
        type: MenuItemEnum.orders,
        isBadge: true),
    MenuItemModel(
        icon: AssetPath.MENU_ICON, title: "Menu", type: MenuItemEnum.menu),
    MenuItemModel(
        icon: AssetPath.MENU_REPORT_ICON,
        title: "Report",
        type: MenuItemEnum.report),
    MenuItemModel(
        icon: AssetPath.MENU_NOTIFICATION_ICON,
        title: "Notification",
        type: MenuItemEnum.notification),
    MenuItemModel(
        icon: AssetPath.MENU_ACCOUNT_ICON,
        title: "Account",
        type: MenuItemEnum.account),
    MenuItemModel(
        icon: AssetPath.MENU_LOGOUT_ICON,
        title: "Log out",
        type: MenuItemEnum.logout),
  ];
}
