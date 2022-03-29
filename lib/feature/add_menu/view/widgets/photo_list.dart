import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';

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
            // if (!controller.isEdit) ...[
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
            // ] else ...[
            //   Container(
            //     width: 104.0,
            //     height: 104.0,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(6.0),
            //       image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: NetworkImage(
            //               controller.addProductBodyRequest.thumbnail[index])),
            //     ),
            //   ),
            // ],
            Positioned(
              top: -10,
              right: -10,
              child: ElevatedButton(
                onPressed: () {
                  controller.handleRemovePhoto(index);
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
