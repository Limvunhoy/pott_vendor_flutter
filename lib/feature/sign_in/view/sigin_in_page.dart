import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class SignInPage extends StatefulWidget {
  // const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final String initialCountry = 'KH';

  final PhoneNumber number = PhoneNumber(isoCode: 'KH');

  late bool isShowPassword;

  int val = -1;

  FocusNode fieldNode = FocusNode();

  @override
  void initState() {
    isShowPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ImagePathConstant.SIGN_IN_STORE_IMAGE,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Welcom to PottBid!",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
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

                // Container(
                //     padding: EdgeInsets.only(top: 13.5, bottom: 9),
                //     decoration: BoxDecoration(
                //       border: Border(
                //         bottom: BorderSide(width: 1, color: Colors.grey),
                //       ),
                //     ),
                //     child: Row(
                //       children: [
                //         Row(
                //           textDirection: TextDirection.ltr,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           // mainAxisSize: MainAxisSize.min,
                //           children: <Widget>[
                //             SizedBox(width: 10),
                //             Container(
                //               color: Colors.red,
                //             ),
                //             SizedBox(width: 12.0),
                //             Text(
                //               '+855',
                //               textDirection: TextDirection.ltr,
                //             ),
                //             Container(
                //               width: 11,
                //               height: 8,
                //               decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                   image: AssetImage(
                //                       "assets/icons/drop_down_icon.png"),
                //                 ),
                //               ),
                //             )
                //             // IconButton(
                //             //   iconSize: 26,
                //             //   padding: EdgeInsets.zero,
                //             //   constraints: BoxConstraints(),
                //             //   color: Colors.black,
                //             //   onPressed: () {},
                //             //   icon: Icon(Icons.arrow_drop_down),
                //             // ),
                //           ],
                //         ),
                //         Flexible(
                //             child: TextField(
                //           decoration: InputDecoration(
                //             border: UnderlineInputBorder(
                //               borderSide: BorderSide(color: Colors.red),
                //             ),
                //           ),
                //         ))
                //       ],
                //     )),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber phoneNumber) {},
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        initialValue: number,
                        textFieldController: controller,
                        selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                            trailingSpace: false,
                            leadingPadding: 0),
                        selectorTextStyle:
                            TextStyle(fontSize: fontSizeExt.mediumSize),
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        textStyle: TextStyle(fontSize: fontSizeExt.mediumSize),
                        inputDecoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorExt.PRIMARY_COLOR),
                            ),
                            hintText: "Number"),
                        validator: (phone) {
                          return phone!.isEmpty
                              ? "Please enter your phone number"
                              : null;
                        },
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        focusNode: fieldNode,
                        controller: passwordController,
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
                                color: Colors.grey),
                          ),
                        ),
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
                          onPressed: () {},
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
                      onPressed: () {},
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
    );
  }
}
