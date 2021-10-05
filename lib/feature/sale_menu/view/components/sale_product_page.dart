import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/sale_menu/view/widgets/sale_product_item.dart';
import 'package:pott_vendor/utils/common/refresh_widget.dart';

class SaleProductPage extends StatelessWidget {
  const SaleProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: () async {},
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 5,
        itemBuilder: (context, index) {
          return SaleProductItem();
        },
      ),
    );
  }
}
