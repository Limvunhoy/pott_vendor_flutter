import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

class BaseView extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? appBarBackgroundColor;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget body;
  final Color? backgroundColor;
  final Widget? bottomNavigation;

  const BaseView({
    Key? key,
    this.title = "",
    this.titleColor = Colors.black,
    this.appBarBackgroundColor = colorExt.PRIMARY_BACKGROUND_COLOR,
    this.actions,
    this.bottom,
    required this.body,
    this.backgroundColor,
    this.bottomNavigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          title!,
          style: TextStyle(color: titleColor),
        ),
        actions: actions,
        backgroundColor: appBarBackgroundColor,
        bottom: bottom,
        elevation: 0.0,
      ),
      body: body,
      bottomNavigationBar: bottomNavigation,
    );
  }
}
