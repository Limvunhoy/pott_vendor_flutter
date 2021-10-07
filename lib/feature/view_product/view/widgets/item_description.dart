import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/view_product/controller/view_product_controller.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key, required this.controller}) : super(key: key);

  final ViewProductController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: controller.dummyProductItems.length,
        itemBuilder: (context, index) {
          return Image.network(
            controller.dummyProductItems[index],
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
          );
        },
      ),
    );
  }
}
