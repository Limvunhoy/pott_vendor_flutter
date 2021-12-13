import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/feature/register/controller/register_controller.dart';
import 'package:pott_vendor/utils/common/base_button.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class RegisterPage extends GetWidget<RegisterController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return DismissKeyboardContent(
      child: BaseView(
        appBarBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: "Register",
        titleColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30.0, screenSize.width / 5, 30.0, 16.0),
          child: GetBuilder(
              init: controller,
              builder: (_) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextFormField(
                              style:
                                  TextStyle(fontSize: fontSizeExt.mediumSize),
                              decoration: InputDecoration(
                                hintText: "First Name",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorExt.LINE_COLOR),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorExt.LINE_COLOR),
                                ),
                              ),
                              validator: controller.firstnameValidate,
                            ),
                          ),
                          const SizedBox(
                            width: 15.5,
                          ),
                          Flexible(
                            child: TextFormField(
                              style:
                                  TextStyle(fontSize: fontSizeExt.mediumSize),
                              decoration: InputDecoration(
                                hintText: "Last Name",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorExt.LINE_COLOR),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorExt.LINE_COLOR),
                                ),
                              ),
                              validator: controller.lastnameValidate,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: colorExt.LINE_COLOR),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CountryCodePicker(
                                    flagWidth: 28.0,
                                    padding: EdgeInsets.zero,
                                    onChanged: (value) {},
                                    initialSelection: "KH",
                                    textStyle: TextStyle(
                                        fontSize: fontSizeExt.mediumSize,
                                        color: Colors.black),
                                  ),
                                  Container(
                                    width: 11.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/drop_down_icon.png"))),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style:
                                    TextStyle(fontSize: fontSizeExt.mediumSize),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: "Number",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: colorExt.LINE_COLOR),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: colorExt.LINE_COLOR),
                                  ),
                                ),
                                validator: controller.phoneNumberValidate,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: fontSizeExt.mediumSize),
                          decoration: InputDecoration(
                            hintText: "Email",
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorExt.LINE_COLOR),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorExt.LINE_COLOR),
                            ),
                          ),
                          validator: controller.emailValidate,
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(fontSize: fontSizeExt.mediumSize),
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorExt.LINE_COLOR),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorExt.LINE_COLOR),
                            ),
                          ),
                          validator: controller.passwordValidate,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: Radio(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: colorExt.PRIMARY_COLOR,
                                value: 1,
                                groupValue: 1,
                                onChanged: (onValue) {},
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              "Agree to Terms & Conditions",
                              style: TextStyle(
                                color: colorExt.PRIMARY_COLOR,
                                fontSize: fontSizeExt.smallSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 138.0,
                      ),
                      BaseButton(
                        width: MediaQuery.of(context).size.width,
                        onPressed: () {
                          Get.toNamed(Routes.VALIDATION);
                          // if (_formKey.currentState!.validate()) {
                          //   // controller.handleRegister();

                          // }
                        },
                        title: "REGISTER",
                        titleColor: Colors.white,
                        backgroundColor: colorExt.PRIMARY_COLOR,
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
