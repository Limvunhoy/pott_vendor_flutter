import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class ProductOptionWidget extends StatelessWidget {
  const ProductOptionWidget(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16.0),
        padding: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: colorExt.LINE_COLOR),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseTitleText(text: title),
            Icon(
              Icons.arrow_drop_down,
              color: colorExt.LIGHT_GRAY,
            ),
          ],
        ),
      ),
    );
  }
}
