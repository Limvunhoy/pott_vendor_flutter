import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/common/base_medium_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'dart:io' show Platform;

class AppDialog {
  static void showAppDialog(BuildContext context,
      {required VoidCallback onClose, required VoidCallback onConfirm}) {
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: BaseMediumText(
                  text: "Are you sure?",
                ),
                content: BaseSmallText(
                  text: "You want to reject delivery",
                ),
                actions: [
                  CupertinoDialogAction(
                    child: BaseMediumText(
                      text: "No",
                      color: colorExt.PRIMARY_COLOR,
                    ),
                    onPressed: onClose,
                  ),
                  CupertinoDialogAction(
                    child: BaseMediumText(
                      text: "Yes",
                      color: colorExt.PRIMARY_COLOR,
                    ),
                    onPressed: onConfirm,
                  ),
                ],
              );
            })
        : showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Are you sure?\nYou want to reject delivery",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(height: 1.3, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 26.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: onClose,
                              child: BaseMediumText(
                                text: "No",
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFF3F4FA),
                                minimumSize: Size(105, 45),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            ElevatedButton(
                              onPressed: onConfirm,
                              child: BaseMediumText(
                                text: "Okay",
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: colorExt.PRIMARY_COLOR,
                                minimumSize: Size(105, 45),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
  }
}
