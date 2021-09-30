import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/menu/controller/menu_controller.dart';
import 'package:pott_vendor/feature/menu/view/widgets/menu_item_.dart';
import 'package:pott_vendor/feature/menu/view/widgets/sale_report_card.dart';
import 'package:pott_vendor/model/menu/menu_item_model.dart';
import 'package:pott_vendor/utils/app_routes.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class MenuPage extends StatelessWidget {
  final MenuController _menuController = Get.find<MenuController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorExt.PRIMARY_BACKGROUND_COLOR,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 255,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePathConstant.MENU_BACKGROUND_IMAGE),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(defaultSizeExt.basePadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, Vendor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeExt.heading3,
                            fontWeight: fontWeightExt.baseFontWeight),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "My Apple Gold Store",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeExt.mediumSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SaleReportCard(),
            ],
          ),
          const SizedBox(
            height: 44,
          ),
          Container(
            padding: const EdgeInsets.all(defaultSizeExt.basePadding),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    const Color(0xFF4DDCA6),
                    const Color(0xFFFFFFFF),
                  ], radius: 0.6, focal: Alignment.center),
                ),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    mainAxisExtent: 160,
                  ),
                  itemCount: _menuController.menuItemList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red,
                      child: Material(
                        color: Colors.white,
                        child: Ink(
                          child: InkWell(
                            onTap: () {
                              switch (
                                  _menuController.menuItemList[index].type) {
                                case MenuItemEnum.orders:
                                  print("Navigate to order page");
                                  break;
                                case MenuItemEnum.menu:
                                  print("Navigate to menu page");
                                  break;
                                case MenuItemEnum.report:
                                  print("Navigate to report page");
                                  break;
                                case MenuItemEnum.notification:
                                  print("Navigate to notification page");
                                  Get.toNamed(Routes.NOTIFICATION);
                                  break;
                                case MenuItemEnum.account:
                                  print("Navigate to account page");
                                  break;
                                case MenuItemEnum.logout:
                                  print("Navigate to logout page");
                                  break;
                              }
                            },
                            child: MenuItem(
                                menuItemModel:
                                    _menuController.menuItemList[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                bottom: true,
                child: Container(
                  child: Text(
                    "2020 Pottbid, all rights reserved",
                    style: TextStyle(fontSize: fontSizeExt.smallSize),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
