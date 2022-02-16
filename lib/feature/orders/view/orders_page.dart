import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/components/completed_page.dart';
import 'package:pott_vendor/feature/orders/view/components/finished_page.dart';
import 'package:pott_vendor/feature/orders/view/components/new_page.dart';
import 'package:pott_vendor/feature/orders/view/components/ready_page.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/export.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class OrdersPage extends StatelessWidget {
  final ordersController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarBackgroundColor: Colors.white,
      title: "Orders",
      bottom: TabBar(
        controller: ordersController.tabController,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: colorExt.PRIMARY_COLOR),
          insets: EdgeInsets.symmetric(horizontal: 40.0),
        ),
        labelStyle: TextStyle(
            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
        unselectedLabelColor: Colors.black,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
        tabs: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tab(
                text: "New",
              ),
              ordersController.newOrderRecords.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(left: 2.0),
                      width: 16.0,
                      height: 16.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF0000),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${ordersController.getNewOrderCount()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeExt.extraSmallSize),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          Tab(
            text: "Ready",
          ),
          Tab(
            text: "Finished",
          ),
          Tab(
            text: "Completed",
          ),
        ],
      ),
      body: GetBuilder(
          init: ordersController,
          builder: (_) {
            return Container(
              color: colorExt.PRIMARY_BACKGROUND_COLOR,
              child: TabBarView(
                controller: ordersController.tabController,
                children: [
                  // EmptyNewOrdersWidget(),
                  NewPage(
                    key: PageStorageKey<String>("newOrderPage"),
                    ordersController: ordersController,
                  ),
                  ReadyPage(
                    key: PageStorageKey<String>("readyOrderPage"),
                    ordersController: ordersController,
                  ),
                  FinishedPage(
                    key: PageStorageKey<String>("finishedOrderPage"),
                    ordersController: ordersController,
                  ),
                  CompletedPage(
                    key: PageStorageKey<String>("completedOrderPage"),
                    ordersController: ordersController,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
