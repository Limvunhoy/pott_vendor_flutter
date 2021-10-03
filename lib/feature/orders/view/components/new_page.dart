import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_item.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print("Refreshing");
      },
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return NewItem();
          }),
    );
  }
}
