import 'package:flutter/material.dart';
import 'package:pott_vendor/core/model/menu/menu_item_model.dart';
import 'package:pott_vendor/feature/menu/controller/menu_controller.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key, required this.menuItemModel, required this.controller})
      : super(key: key);

  final MenuItemModel menuItemModel;
  final MenuController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(menuItemModel.icon),
                  ),
                ),
              ),
              if (menuItemModel.isBadge && controller.newOrderBadges.value != 0)
                Positioned(
                  top: -5,
                  right: 0,
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF0000),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "${controller.newOrderBadges.value}",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: appSizeExt.basePadding,
          ),
          Text(
            "${menuItemModel.title}",
            style: TextStyle(
                fontSize: fontSizeExt.smallSize,
                fontWeight: fontWeightExt.baseFontWeight),
          ),
        ],
      ),
    );
  }
}
