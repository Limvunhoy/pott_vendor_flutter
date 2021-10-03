import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {
        print("On Refresh");
      },
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (context, index) {
          return NewItem();
        },
      ),
    );
  }
}
