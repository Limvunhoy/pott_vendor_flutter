import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/sale_menu/controller/sale_menu_controller.dart';
import 'package:pott_vendor/feature/sale_menu/view/components/bid_product_page.dart';
import 'package:pott_vendor/feature/sale_menu/view/components/sale_product_page.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/common/colored_tab_bar.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

class SaleMenuScreen extends StatelessWidget {
  // const SaleMenuScreen({Key? key}) : super(key: key);
  final _controller = Get.find<SaleMenuController>();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarBackgroundColor: colorExt.PRIMARY_COLOR,
      title: "Menu",
      titleColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_MENU);
          },
          icon: Image.asset(
            AssetPath.APP_BAR_EDIT_ICON,
            fit: BoxFit.cover,
            width: 22.0,
            height: 22.0,
          ),
        ),
      ],
      bottom: ColoredTabBar(
        color: Colors.white,
        tabBar: TabBar(
          controller: _controller.tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: colorExt.PRIMARY_COLOR),
            insets: EdgeInsets.symmetric(horizontal: 85.0),
          ),
          labelStyle: TextStyle(
              fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
          unselectedLabelColor: Colors.black,
          labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          tabs: [
            Tab(
              text: "Sale Products",
            ),
            Tab(
              text: "Bid Products",
            )
          ],
        ),
      ),
      body: GetBuilder(
          init: _controller,
          builder: (_) {
            return Container(
              color: colorExt.PRIMARY_BACKGROUND_COLOR,
              child: TabBarView(
                controller: _controller.tabController,
                children: [
                  SaleProductPage(
                    controller: _controller,
                  ),
                  BidProductPage(
                    controller: _controller,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
