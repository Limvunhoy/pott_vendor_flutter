import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/sale_menu/view/components/bid_product_page.dart';
import 'package:pott_vendor/feature/sale_menu/view/components/sale_product_page.dart';
import 'package:pott_vendor/feature/sale_menu/view/widgets/bid_prodcut_item.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class SaleMenuScreen extends StatelessWidget {
  const SaleMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseView(
        backgroundColor: Colors.white,
        title: "Orders",
        bottom: TabBar(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: colorExt.PRIMARY_COLOR),
            insets: EdgeInsets.symmetric(horizontal: 95.0),
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
        body: Container(
          color: colorExt.PRIMARY_BACKGROUND_COLOR,
          child: TabBarView(
            children: [
              SaleProductPage(),
              BidProductPage(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
