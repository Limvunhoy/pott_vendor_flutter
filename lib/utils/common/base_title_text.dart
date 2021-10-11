import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BaseTitleText extends StatelessWidget {
  const BaseTitleText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start})
      : super(key: key);

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSizeExt.mediumSize,
        fontWeight: FontWeight.w600,
      ),
      textAlign: textAlign,
    );
  }
}
