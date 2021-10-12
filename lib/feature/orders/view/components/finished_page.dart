import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({Key? key}) : super(key: key);

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
        itemCount: 10,
        itemBuilder: (context, index) {
          return NewItem(
            orderStatus: OrderStatus.finished,
            onConfirm: () {},
          );
        },
      ),
    );
  }
}
