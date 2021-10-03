import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/orders/view/components/new_page.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: BaseView(
        backgroundColor: Colors.white,
        title: "Orders",
        bottom: TabBar(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: colorExt.PRIMARY_COLOR),
            insets: EdgeInsets.symmetric(horizontal: 40.0),
          ),
          labelStyle: TextStyle(
              fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(
              text: "New",
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
        body: Container(
          color: colorExt.PRIMARY_BACKGROUND_COLOR,
          child: TabBarView(
            children: [
              NewPage(),
              Center(
                child: Text("Ready"),
              ),
              Center(
                child: Text("Finished"),
              ),
              Center(
                child: Text("Completed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
