import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/add_description_widget.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/add_photo_widget.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/photo_description_list.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/product_option_widget.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/base_medium_text.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';

class AddMenuPage extends StatelessWidget {
  final AddMenuController _controller = Get.find<AddMenuController>();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Add Menu",
      titleColor: Colors.black,
      appBarBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(appSizeExt.basePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 2,
                        height: 11,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: colorExt.PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      BaseTitleText(text: "Photo"),
                      Expanded(
                        child: BaseMediumText(
                          text: "0/10",
                          color: colorExt.LIGHT_GRAY,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  AddPhotoWidget(
                    frameWidth: 104.0,
                    frameHeight: 104.0,
                    iconWidth: 37.37,
                    iconHeight: 30.77,
                    fontSize: fontSizeExt.smallSize,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF6F6F6),
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(appSizeExt.basePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 2.5,
                        height: 11,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: colorExt.PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      BaseTitleText(text: "Product Detail"),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  BaseTitleText(text: "Title"),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: TextFormField(
                      cursorColor: colorExt.PRIMARY_COLOR,
                      style: TextStyle(fontSize: fontSizeExt.smallSize),
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                            fontSize: fontSizeExt.smallSize,
                            color: colorExt.LIGHT_GRAY),
                      ),
                    ),
                  ),
                  ProductOptionWidget(
                    title: "Category",
                    onTap: () {
                      Get.toNamed(Routes.CHOOSE_CATEGORY);
                    },
                  ),
                  ProductOptionWidget(
                    title: "Product Option",
                    onTap: () {
                      print("Navigate to Product Option Screen");
                      Get.toNamed(Routes.PRODUCT_OPTION);
                    },
                  ),
                  AddDescriptionWidget(controller: _controller),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseTitleText(text: "Photo Description"),
                            BaseMediumText(
                              text: "3/10",
                              color: colorExt.LIGHT_GRAY,
                            ),
                          ],
                        ),
                        // TODO: Add Photo List
                        // Row(
                        //   children: [
                        //     AddPhotoWidget(
                        //       frameWidth: 70.0,
                        //       frameHeight: 70.0,
                        //       iconWidth: 25.15,
                        //       iconHeight: 20.71,
                        //       fontSize: fontSizeExt.extraSmallSize,
                        //       onTap: () async {
                        //         final source = await showImageSource(context);
                        //         if (source != null) {
                        //           _controller.pickImage(source);
                        //         }
                        //       },
                        //     ),
                        //   ],
                        // ),
                        PhotoDescriptionList(
                          onTap: () async {
                            // final source = await showImageSource(context);
                            // if (source != null) {
                            //   _controller.pickImage(source);
                            // }
                            _controller.pickImage();
                          },
                          controller: _controller,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigation: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(appSizeExt.basePadding),
          child: BaseButton(
            onPressed: () {},
            title: "Create",
            titleColor: Colors.white,
            backgroundColor: colorExt.PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}

extension on AddMenuPage {
  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back(result: ImageSource.camera);
              },
              child: Text("Take Photo"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back(result: ImageSource.gallery);
              },
              child: Text("Choose From Library"),
            ),
          ],
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Take Photo"),
              onTap: () {
                Get.back(result: ImageSource.camera);
              },
            ),
            ListTile(
              title: Text("Gallery"),
              onTap: () {
                Get.back(result: ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    }
  }
}
