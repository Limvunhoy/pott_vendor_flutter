import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BaseSmallText extends StatelessWidget {
  const BaseSmallText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSizeExt.smallSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
