import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/menu/view/menu_page.dart';
import 'package:pott_vendor/feature/sign_in/controller/sign_in_controller.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late bool isShowPassword;

  int val = -1;

  FocusNode fieldNode = FocusNode();

  final signInController = Get.find<AuthController>();

  @override
  void initState() {
    isShowPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardContent(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              reverse: true,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 37.0),
                    height: 153.0,
                    child: Image.asset(
                      AssetPath.SIGN_IN_STORE_IMAGE,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Welcome to PottBid!",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    "Vendor App",
                    style: TextStyle(
                        fontSize: fontSizeExt.mediumSize, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 69.0,
                  ),
                  Form(
                    key: signInController.formKey,
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey),
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
                                  controller:
                                      signInController.phoneNumberController,
                                  style: TextStyle(
                                      fontSize: fontSizeExt.mediumSize),
                                  decoration: InputDecoration(
                                    hintText: "Number",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.0, color: Colors.grey),
                                    ),
                                  ),
                                  validator:
                                      signInController.phoneNumberValidate,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          focusNode: fieldNode,
                          controller: signInController.passwordController,
                          obscureText: !isShowPassword,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorExt.PRIMARY_COLOR),
                            ),
                            hintText: "Password",
                            labelStyle: TextStyle(color: Colors.red),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isShowPassword = !isShowPassword;
                                });
                              },
                              icon: Icon(
                                isShowPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: signInController.phoneNumberValidate,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: colorExt.PRIMARY_COLOR,
                                  value: 1,
                                  groupValue: val,
                                  onChanged: (onValue) {
                                    setState(
                                      () {
                                        val = onValue as int;
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: fontSizeExt.smallSize,
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text("Forgot password"),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(10, 10),
                                    alignment: Alignment.centerRight,
                                    primary: Colors.grey,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    textStyle: TextStyle(
                                      fontSize: fontSizeExt.smallSize,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 38.0,
                          child: ElevatedButton(
                            onPressed: () {
                              signInController.onLogIn();
                              Get.offNamed(Routes.MENU);
                            },
                            child: Text("LOG IN"),
                            style: ElevatedButton.styleFrom(
                              primary: colorExt.PRIMARY_COLOR,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              textStyle: TextStyle(
                                fontSize: fontSizeExt.mediumSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No account? | ",
                        style: TextStyle(
                          fontSize: fontSizeExt.mediumSize,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text("Register"),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(10, 10),
                          alignment: Alignment.centerRight,
                          primary: colorExt.PRIMARY_COLOR,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          textStyle: TextStyle(
                            fontSize: fontSizeExt.mediumSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
