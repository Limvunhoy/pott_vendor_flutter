import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BaseLargeText extends StatelessWidget {
  const BaseLargeText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight,
      this.textAlign})
      : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSizeExt.largeSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
