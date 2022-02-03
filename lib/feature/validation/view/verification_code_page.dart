import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pott_vendor/feature/validation/controller/verification_code_controller.dart';
import 'package:pott_vendor/utils/common/base_medium_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class VerificationCodePage extends GetWidget<VerificationCodeController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return BaseView(
      appBarBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, screenSize.width / 5, 30.0, 16.0),
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
            const SizedBox(
              height: 63.0,
            ),
            GetBuilder(
                init: controller,
                builder: (_) {
                  return Form(
                    key: _formKey,
                    child: Container(
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: fontSizeExt.mediumSize),
                        decoration: InputDecoration(
                            hintText: "Enter Code",
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
                            suffix: Text("${controller.countdownTime}s"),
                            suffixStyle:
                                TextStyle(color: colorExt.PRIMARY_COLOR)),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
