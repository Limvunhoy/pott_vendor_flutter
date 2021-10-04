import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class NewProductOptionItem extends StatelessWidget {
  const NewProductOptionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 3.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: colorExt.PRIMARY_BACKGROUND_COLOR),
      child: Text(
        "White, 8GB",
        style: TextStyle(fontSize: fontSizeExt.smallSize, color: Colors.grey),
      ),
    );
  }
}
