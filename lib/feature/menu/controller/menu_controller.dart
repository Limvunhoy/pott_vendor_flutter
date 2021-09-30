import 'package:get/get.dart';
import 'package:pott_vendor/model/menu/menu_item_model.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';

class MenuController extends GetxController {
  List<MenuItemModel> menuItemList = [
    MenuItemModel(
        icon: ImagePathConstant.MENU_ORDER_ICON,
        title: "Orders",
        type: MenuItemEnum.orders,
        isBadge: true),
    MenuItemModel(
        icon: ImagePathConstant.MENU_ICON,
        title: "Menu",
        type: MenuItemEnum.menu),
    MenuItemModel(
        icon: ImagePathConstant.MENU_REPORT_ICON,
        title: "Report",
        type: MenuItemEnum.report),
    MenuItemModel(
        icon: ImagePathConstant.MENU_NOTIFICATION_ICON,
        title: "Notification",
        type: MenuItemEnum.notification),
    MenuItemModel(
        icon: ImagePathConstant.MENU_ACCOUNT_ICON,
        title: "Account",
        type: MenuItemEnum.account),
    MenuItemModel(
        icon: ImagePathConstant.MENU_LOGOUT_ICON,
        title: "Log out",
        type: MenuItemEnum.logout),
  ];
}
