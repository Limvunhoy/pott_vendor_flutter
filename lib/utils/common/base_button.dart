import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BaseButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? borderColor;

  const BaseButton(
      {Key? key,
      this.width,
      this.height = 38.0,
      required this.onPressed,
      required this.title,
      this.backgroundColor = Colors.white,
      this.titleColor = Colors.black,
      this.borderColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: titleColor, fontSize: fontSizeExt.mediumSize),
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 0.0,
          side: BorderSide(width: 1, color: borderColor!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
