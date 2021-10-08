import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BaseTitleText extends StatelessWidget {
  const BaseTitleText({Key? key, required this.text, this.color = Colors.black})
      : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Photo",
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSizeExt.mediumSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
