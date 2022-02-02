import 'package:get/get.dart';
import 'package:pott_vendor/core/model/menu/home_report_response.dart';
import 'package:pott_vendor/core/model/menu/menu_item_model.dart';
import 'package:pott_vendor/core/service/menu/menu_service.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

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

  HomeReportData? homeReportData;

  MenuService _service = MenuService();
  Rx<FetchStatus> fetchStatus = FetchStatus.idle.obs;

  RxString todaySale = "".obs;
  RxString yesterdaySale = "".obs;
  RxInt newOrderBadges = 0.obs;

  @override
  void onInit() async {
    getHomeReport();
    super.onInit();
  }

  getHomeReport() async {
    try {
      fetchStatus.value = FetchStatus.loading;
      homeReportData = await _service.getHomeReport();

      if (homeReportData != null) {
        todaySale.value = homeReportData!.today.toString();
        yesterdaySale.value = homeReportData!.yesterday.toString();
        newOrderBadges.value = homeReportData!.newOrder;
      }

      fetchStatus.value = FetchStatus.complete;
      update();
    } catch (e) {
      print("Failed to Get Home Report: $e");
      fetchStatus.value = FetchStatus.error;
      update();
    }
  }
}
