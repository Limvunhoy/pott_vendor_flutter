import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class AccountTextField extends StatelessWidget {
  const AccountTextField(
      {Key? key,
      this.controller,
      required this.title,
      required this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.isEnableSuggestion = true,
      this.isAutoCorrect = true,
      this.onChanged,
      this.prefix})
      : super(key: key);

  final TextEditingController? controller;
  final String title;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? isEnableSuggestion;
  final bool? isAutoCorrect;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSizeExt.extraSmallSize,
            ),
          ),
          SizedBox(
            height: 38.0,
            child: TextFormField(
              controller: controller,
              cursorColor: colorExt.PRIMARY_COLOR,
              keyboardType: keyboardType,
              obscureText: obscureText!,
              autocorrect: isAutoCorrect!,
              enableSuggestions: isEnableSuggestion!,
              onChanged: onChanged,
              style: TextStyle(fontSize: fontSizeExt.mediumSize),
              decoration: InputDecoration(
                fillColor: Colors.red,
                hintText: hintText,
                prefix: prefix,
                hintStyle: TextStyle(
                    fontSize: fontSizeExt.mediumSize,
                    color: colorExt.LIGHT_GRAY),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: colorExt.PRIMARY_COLOR, width: 1),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorExt.LINE_COLOR, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
