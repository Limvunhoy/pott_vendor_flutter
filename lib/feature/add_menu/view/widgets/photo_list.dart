import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/add_photo_widget.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({Key? key, required this.controller}) : super(key: key);

  final AddMenuController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 10.0,
        );
      },
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      primary: false,
      physics: ClampingScrollPhysics(),
      itemCount: controller.photos.length,
      itemBuilder: (context, index) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 104.0,
              height: 104.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    controller.photos[index],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -23,
              right: -23,
              child: IconButton(
                onPressed: () {
                  print("Remove Image");
                  controller.handleRemovePhoto(index);
                },
                icon: Icon(
                  Icons.cancel_sharp,
                  size: 28.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
