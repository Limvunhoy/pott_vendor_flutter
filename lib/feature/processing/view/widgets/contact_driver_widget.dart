import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class ContactDriverWidget extends StatelessWidget {
  const ContactDriverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact to driver",
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSizeExt.mediumSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            "Call ask about delivery",
            style: TextStyle(
              color: colorExt.LIGHT_GRAY,
              fontSize: fontSizeExt.smallSize,
            ),
          ),
        ],
      ),
    );
  }
}
