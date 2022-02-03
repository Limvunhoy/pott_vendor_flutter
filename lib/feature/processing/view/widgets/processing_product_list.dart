import 'package:flutter/material.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class ProcessingProductList extends StatelessWidget {
  const ProcessingProductList({Key? key, required this.orderItemList})
      : super(key: key);

  final List<OrderItemListResponse> orderItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(appSizeExt.baseBorderRadius),
        color: Color(0xFFF2F2F2),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        itemCount: orderItemList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("iPhone 13 Pro Max"),
                    Text("\$${orderItemList[index].productVariance.price}"),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${orderItemList[index].productVariance.combination}"),
                    Text("${orderItemList[index].qty}"),
                  ],
                ),
                Divider(
                  color: colorExt.LINE_COLOR,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
