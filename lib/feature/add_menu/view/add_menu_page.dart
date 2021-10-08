import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';

class AddMenuPage extends StatelessWidget {
  // const AddMenuPage({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.all(defaultSizeExt.basePadding),
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
                      // Text(
                      //   "Photo",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: fontSizeExt.mediumSize,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      Expanded(
                        child: Text(
                          "0/10",
                          style: TextStyle(
                            color: colorExt.LIGHT_GRAY,
                            fontSize: fontSizeExt.mediumSize,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  Material(
                    child: Ink(
                      width: 104.0,
                      height: 104.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE9E9E9),
                        borderRadius: BorderRadius.circular(
                            defaultSizeExt.baseBorderRadius),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                            defaultSizeExt.baseBorderRadius),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagePathConstant.ADD_PHOTO_ICON,
                              fit: BoxFit.cover,
                              width: 37.37,
                              height: 30.77,
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              "Add Photo",
                              style: TextStyle(
                                fontSize: fontSizeExt.smallSize,
                                color: colorExt.DARK_GRAY,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
              padding: const EdgeInsets.all(defaultSizeExt.basePadding),
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
                      Text(
                        "Product Detail",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSizeExt.mediumSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Title",
                    style: TextStyle(
                        fontSize: fontSizeExt.mediumSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
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
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1, color: colorExt.LINE_COLOR),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category",
                          style: TextStyle(
                              fontSize: fontSizeExt.mediumSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: colorExt.LIGHT_GRAY,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1, color: colorExt.LINE_COLOR),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Option",
                          style: TextStyle(
                              fontSize: fontSizeExt.mediumSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: colorExt.LIGHT_GRAY,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: fontSizeExt.mediumSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 9.0),
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Obx(
                            () => TextField(
                              onChanged: (valueChanged) {
                                _controller.counterText(valueChanged);
                              },
                              maxLines: 5,
                              maxLength: 200,
                              cursorColor: colorExt.PRIMARY_COLOR,
                              style: TextStyle(fontSize: fontSizeExt.smallSize),
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
                                  counterText:
                                      "${_controller.enteredText.value.length}/200"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Photo Description",
                              style: TextStyle(
                                  fontSize: fontSizeExt.mediumSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              "3/10",
                              style: TextStyle(
                                fontSize: fontSizeExt.mediumSize,
                                color: colorExt.LIGHT_GRAY,
                              ),
                            ),
                          ],
                        ),
                        Container(
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
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Material(
                                child: Ink(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE9E9E9),
                                    borderRadius: BorderRadius.circular(
                                        defaultSizeExt.baseBorderRadius),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(
                                        defaultSizeExt.baseBorderRadius),
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ImagePathConstant.ADD_PHOTO_ICON,
                                          fit: BoxFit.cover,
                                          width: 25.15,
                                          height: 20.71,
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Text(
                                          "Add Photo",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize:
                                                fontSizeExt.extraSmallSize,
                                            color: colorExt.DARK_GRAY,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
      ),
      bottomNavigation: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(defaultSizeExt.basePadding),
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
