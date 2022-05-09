import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/helper/cache_image_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({Key? key, required this.controller}) : super(key: key);

  final AddMenuController controller;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 10.0,
        );
      },
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemScrollController: controller.photoListItemScrollController,
      // primary: false,
      physics: ClampingScrollPhysics(),
      itemCount: controller.photos.length,
      itemBuilder: (context, index) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // if (!controller.isEdit) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: controller.photos[index].runtimeType != String
                  ? Container(
                      width: 104.0,
                      height: 104.0,
                      decoration: BoxDecoration(
                        color: colorExt.PRIMARY_BACKGROUND_COLOR,
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                            controller.photos[index],
                          ),
                          // image: MemoryImage(controller.photos[index]),
                        ),
                      ),
                    )
                  : CacheImageManager.cacheNetworkImage(
                      width: 104.0,
                      height: 104.0,
                      imageUrl: controller.photos[index].runtimeType != String
                          // ? String.fromCharCodes(controller.photos[index])
                          // ? FileImage(controller.photos[index])
                          ? ""
                          : controller.photos[index],
                      errorWidget: (context, _, __) {
                        return Container(
                          width: 104.0,
                          height: 104.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Icon(Icons.error),
                        );
                      },
                    ),
            ),
            // Container(
            //   width: 104.0,
            //   height: 104.0,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(6.0),
            //     image: DecorationImage(
            //         fit: BoxFit.cover,
            //         // image: FileImage(
            //         //   controller.photos[index],
            //         // ),
            //         image: MemoryImage(controller.photos[index])),
            //   ),
            // ),
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
