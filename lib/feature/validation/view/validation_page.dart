import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/common/base_medium_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class ValidationPage extends StatelessWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return DismissKeyboardContent(
      child: BaseView(
        appBarBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(30.0, screenSize.width / 4, 30.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Verification code has been sent to your phone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSizeExt.heading3,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorExt.PRIMARY_COLOR),
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
                      isShowPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                validator: signInController.phoneNumberValidate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
