import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:pott_vendor/feature/orders/view/widgets/completed_order_item.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        print("Refreshing");
      },
      child: ListView.builder(
        key: PageStorageKey("readyOrderList"),
        shrinkWrap: true,
        primary: false,
        itemCount: 3,
        itemBuilder: (context, index) {
          return CompletedOrderItem();
        },
      ),
    );
  }
}
