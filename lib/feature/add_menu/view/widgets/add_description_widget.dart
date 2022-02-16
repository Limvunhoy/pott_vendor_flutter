import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class AddDescriptionWidget extends StatelessWidget {
  const AddDescriptionWidget({Key? key, required this.controller})
      : super(key: key);

  final AddMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseTitleText(text: "Description"),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9.0),
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Obx(
              () => TextField(
                controller: controller.descriptionTextController,
                onChanged: (valueChanged) {
                  controller.counterText(valueChanged);
                },
                maxLines: 5,
                maxLength: 200,
                cursorColor: colorExt.PRIMARY_COLOR,
                style: TextStyle(fontSize: fontSizeExt.smallSize),
                textCapitalization: TextCapitalization.sentences,
                decoration: new InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Please input description",
                    hintStyle: TextStyle(
                        fontSize: fontSizeExt.smallSize,
                        color: colorExt.LIGHT_GRAY),
                    counterStyle: TextStyle(
                        fontSize: fontSizeExt.extraSmallSize,
                        color: colorExt.LIGHT_GRAY),
                    counterText: "${controller.enteredText.value.length}/200"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
