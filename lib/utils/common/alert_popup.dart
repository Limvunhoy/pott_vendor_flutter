import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/common/base_medium_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'dart:io' show Platform;

class AppDialog {
  static void showAppDialog(
    BuildContext context, {
    required VoidCallback onClose,
    required VoidCallback onConfirm,
    required String title,
    required String subtitle,
    String? secondButtonTitle,
  }) {
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: BaseMediumText(
                  text: title,
                ),
                content: BaseSmallText(
                  text: subtitle,
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
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(height: 1.3, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1.3),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onClose,
                              child: BaseMediumText(
                                text: "No",
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFF3F4FA),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onConfirm,
                              child: BaseMediumText(
                                text: secondButtonTitle ?? "Okay",
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: colorExt.PRIMARY_COLOR,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
  }
}
