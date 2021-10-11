import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/add_photo_widget.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class PhotoDescriptionList extends StatelessWidget {
  const PhotoDescriptionList(
      {Key? key, required this.onTap, required this.controller})
      : super(key: key);

  final VoidCallback onTap;
  final AddMenuController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.only(top: 13.0),
            height: 70.0,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.0,
                );
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              physics: ClampingScrollPhysics(),
              itemCount: controller.selectedImages!.length + 1,
              itemBuilder: (context, index) {
                return index == 0
                    ? AddPhotoWidget(
                        frameWidth: 70.0,
                        frameHeight: 70.0,
                        iconWidth: 25.15,
                        iconHeight: 20.71,
                        fontSize: fontSizeExt.extraSmallSize,
                        onTap: onTap,
                      )
                    : controller.selectedImages != null
                        ? Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(controller
                                      .selectedImages![index - 1].path),
                                ),
                              ),
                            ),
                          )
                        : Container();
              },
            ),
          );
        });
  }
}
