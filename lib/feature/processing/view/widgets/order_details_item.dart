import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem(
      {Key? key,
      required this.title,
      required this.value,
      this.valueColor = Colors.black,
      this.backgroundColor = Colors.transparent,
      this.fontWeight = FontWeight.w400})
      : super(key: key);
  final String title;
  final String value;
  final Color? valueColor;
  final Color? backgroundColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: colorExt.LIGHT_GRAY, fontSize: fontSizeExt.smallSize),
        ),
        Flexible(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 3.0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                value,
                style: TextStyle(
                    color: valueColor,
                    fontSize: fontSizeExt.mediumSize,
                    fontWeight: fontWeight),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
