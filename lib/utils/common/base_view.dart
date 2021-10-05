import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

class BaseView extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget body;

  const BaseView(
      {Key? key,
      this.title = "",
      this.titleColor = Colors.black,
      this.backgroundColor = colorExt.PRIMARY_BACKGROUND_COLOR,
      this.actions,
      this.bottom,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: TextStyle(color: titleColor),
        ),
        actions: actions,
        backgroundColor: backgroundColor,
        bottom: bottom,
        elevation: 0.0,
      ),
      body: body,
    );
  }
}
