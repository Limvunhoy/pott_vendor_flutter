import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/core/model/category/category_response.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/add_description_widget.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/add_photo_widget.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/photo_description_list.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/photo_list.dart';
import 'package:pott_vendor/feature/add_menu/view/widgets/product_option_widget.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/base_medium_text.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';

enum ProductPhotoType {
  productPhoto,
  photoDescription,
}

class AddMenuPage extends GetWidget<AddMenuController> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Add Menu",
      titleColor: Colors.black,
      appBarBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: colorExt.PRIMARY_COLOR,
        ),
      ),
      body: DismissKeyboardContent(
        child: GetBuilder(
            init: controller,
            builder: (_) {
              return SingleChildScrollView(
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
                                  text: "${controller.photos.length}/10",
                                  color: colorExt.LIGHT_GRAY,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AddPhotoWidget(
                                frameWidth: 104.0,
                                frameHeight: 104.0,
                                iconWidth: 37.37,
                                iconHeight: 30.77,
                                fontSize: fontSizeExt.smallSize,
                                onTap: () {
                                  // controller.photoPicker();
                                  showImageSource(
                                      context, ProductPhotoType.productPhoto);
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                width: 104,
                                height: 104,
                                child: PhotoList(
                                  controller: controller,
                                ),
                              )
                                  // Expanded(
                                  //   child: Container(
                                  //     width: 125,
                                  //     height: 125,
                                  //     child: PhotoList(
                                  //       controller: controller,
                                  //     ),
                                  // child: ListView.separated(
                                  //     scrollDirection: Axis.horizontal,
                                  //     shrinkWrap: true,
                                  //     primary: false,
                                  //     itemCount: 5,
                                  //     separatorBuilder: (context, index) {
                                  //       return const SizedBox(
                                  //         width: 10,
                                  //       );
                                  //     },
                                  //     itemBuilder: (context, index) {
                                  //       // return Container(
                                  //       //   color: Colors.grey,
                                  //       //   width: 104,
                                  //       //   height: 104,
                                  //       // );
                                  //       return Stack(
                                  //         clipBehavior: Clip.none,
                                  //         children: [
                                  //           Center(
                                  //             child: Container(
                                  //               color: Colors.grey,
                                  //               width: 104,
                                  //               height: 104,
                                  //             ),
                                  //           ),
                                  //           Positioned(
                                  //             top: -15,
                                  //             right: 0,
                                  //             child: IconButton(
                                  //               onPressed: () {
                                  //                 print("Remove Image");
                                  //                 controller
                                  //                     .handleRemoveDescriptionPhoto(
                                  //                         index);
                                  //               },
                                  //               icon: Icon(
                                  //                 Icons.cancel_sharp,
                                  //               ),
                                  //             ),
                                  //           )
                                  //         ],
                                  //       );
                                  //     }),
                                  // ),
                                  )
                            ],
                          ),

                          // Row(
                          //   children: [
                          //     AddPhotoWidget(
                          //       frameWidth: 104.0,
                          //       frameHeight: 104.0,
                          //       iconWidth: 37.37,
                          //       iconHeight: 30.77,
                          //       fontSize: fontSizeExt.smallSize,
                          //       onTap: () {
                          //         // controller.photoPicker();
                          //         showImageSource(
                          //             context, ProductPhotoType.productPhoto);
                          //       },
                          //     ),
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     // Expanded(
                          //     //     child: PhotoList(controller: controller)),
                          //     Expanded(
                          //       child: Container(
                          //         height: 104,
                          //         color: Colors.transparent,
                          //         child: PhotoList(
                          //           controller: controller,
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextFormField(
                              controller: controller.titleTextController,
                              cursorColor: colorExt.PRIMARY_COLOR,
                              textCapitalization: TextCapitalization.sentences,
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
                            isCategory: true,
                            selectedCategory:
                                controller.selectedCategory?.data.nameEn,
                            onTap: () {
                              Get.toNamed(Routes.CHOOSE_CATEGORY)
                                  ?.then((result) {
                                if (result is CategoryResult) {
                                  controller.updateSelectedCategory(result);
                                }
                              });
                            },
                          ),
                          // ProductOptionWidget(
                          //   title: "Product Option",
                          //   onTap: () {
                          //     print("Navigate to Product Option Screen");
                          //     Get.toNamed(Routes.PRODUCT_OPTION);
                          //   },
                          // ),
                          AddDescriptionWidget(controller: controller),
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BaseTitleText(text: "Photo Description"),
                                    BaseMediumText(
                                      text:
                                          "${controller.descriptionPhotos.length}/${controller.limitPhoto}",
                                      color:
                                          controller.descriptionPhotos.length >
                                                  controller.limitPhoto
                                              ? Colors.red
                                              : colorExt.LIGHT_GRAY,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 30),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: 2.5,
                                            height: 11,
                                            decoration: BoxDecoration(
                                              color: colorExt.PRIMARY_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AddPhotoWidget(
                                        frameWidth: 70.0,
                                        frameHeight: 70.0,
                                        iconWidth: 25.15,
                                        iconHeight: 20.71,
                                        fontSize: fontSizeExt.extraSmallSize,
                                        onTap: () {
                                          showImageSource(
                                              context,
                                              ProductPhotoType
                                                  .photoDescription);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      PhotoDescriptionList(
                                        controller: controller,
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
                  ],
                ),
              );
            }),
      ),
      bottomNavigation: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(appSizeExt.basePadding),
          child: BaseButton(
            onPressed: () async {
              // controller.uploadProductPhotos();
              if (controller.isEdit) {
                controller.addProductBodyRequest.categoryId =
                    "621ce74871132eee5e1c71a9";
                Get.toNamed(Routes.PRODUCT_OPTION, arguments: {
                  "isEdit": true,
                  "bodyRequest": controller.addProductBodyRequest
                });
              } else {
                final res = controller.handleContinue();
                Get.toNamed(Routes.PRODUCT_OPTION,
                    arguments: {"isEdit": false, "bodyRequest": res});
              }
            },
            title: "Continue",
            titleColor: Colors.white,
            backgroundColor: colorExt.PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}

extension on AddMenuPage {
  Future<ImageSource?> showImageSource(
      BuildContext context, ProductPhotoType photoType) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                switch (photoType) {
                  case ProductPhotoType.productPhoto:
                    controller.photoCameraPicker();
                    Get.back();
                    break;
                  case ProductPhotoType.photoDescription:
                    controller.photoDescriptionCameraPicker();
                    Get.back();
                    break;
                }
              },
              child: Text("Take Photo"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                switch (photoType) {
                  case ProductPhotoType.productPhoto:
                    controller.photoPicker();
                    Get.back();
                    break;
                  case ProductPhotoType.photoDescription:
                    controller.descriptionPhotoPicker();
                    Get.back();
                    break;
                }
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
                switch (photoType) {
                  case ProductPhotoType.productPhoto:
                    controller.photoCameraPicker();
                    break;
                  case ProductPhotoType.photoDescription:
                    controller.photoDescriptionCameraPicker();
                    break;
                }
                Get.back(result: ImageSource.camera);
              },
            ),
            ListTile(
              title: Text("Gallery"),
              onTap: () {
                switch (photoType) {
                  case ProductPhotoType.productPhoto:
                    controller.photoPicker();
                    Get.back();
                    break;
                  case ProductPhotoType.photoDescription:
                    controller.descriptionPhotoPicker();
                    Get.back();
                    break;
                }
              },
            ),
          ],
        ),
      );
    }
  }
}
