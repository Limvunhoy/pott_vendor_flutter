import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/add_photo_widget.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class PhotoDescriptionList extends StatelessWidget {
  const PhotoDescriptionList({Key? key, required this.controller})
      : super(key: key);

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
      itemCount: controller.descriptionPhotos.length,
      itemBuilder: (context, index) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // if (!controller.isEdit) ...[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    controller.descriptionPhotos[index],
                  ),
                ),
              ),
            ),
            // ] else ...[
            //   Container(
            //     width: 70.0,
            //     height: 70.0,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(6.0),
            //       image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: NetworkImage(
            //             controller.addProductBodyRequest.images[index],
            //           )),
            //     ),
            //   ),
            // ],
            // Positioned(
            //   top: -9,
            //   right: -20,
            //   child: IconButton(
            //     onPressed: () {
            //       print("Remove Image");
            //       controller.handleRemoveDescriptionPhoto(index);
            //     },
            //     icon: Icon(
            //       Icons.cancel_sharp,
            //     ),
            //   ),
            // ),
            Positioned(
              top: 3,
              right: -12,
              child: ElevatedButton(
                onPressed: () {
                  controller.handleRemoveDescriptionPhoto(index);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
                style: ElevatedButton.styleFrom(
                  // fixedSize: Size(10, 10),
                  minimumSize: Size(20, 20),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(0),
                  primary: Colors.black, // <-- Button color
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
