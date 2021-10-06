import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/order_details_item.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Order Details",
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSizeExt.mediumSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        OrderDetailItem(
          title: "Order ID:",
          value: "#12345",
          valueColor: colorExt.PRIMARY_COLOR,
          backgroundColor: Color(0xFFF0FFF9),
        ),
        const SizedBox(
          height: 14.0,
        ),
        OrderDetailItem(
          title: "Order Date:",
          value: "10-09-2021 | 9:00am",
        ),
        const SizedBox(
          height: 14.0,
        ),
        OrderDetailItem(
          title: "Delivery Address:",
          value: "#35, St 310, Phnom Penh",
        ),
        const SizedBox(
          height: 14.0,
        ),
        OrderDetailItem(
          title: "Delivery Fee:",
          value: "\$1.50",
        ),
      ],
    );
  }
}
