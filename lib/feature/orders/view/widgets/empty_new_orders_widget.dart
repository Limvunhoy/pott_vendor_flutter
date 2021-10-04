import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class EmptyNewOrdersWidget extends StatelessWidget {
  const EmptyNewOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          ImagePathConstant.EMPTY_IMAGE,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 1.5,
        ),
        const SizedBox(
          height: 25.0,
        ),
        Text(
          "No New Order Now",
          style: TextStyle(
              fontSize: fontSizeExt.mediumSize,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 4.5,
        ),
        Text(
          "If have incoming order, you can see here.",
          style: TextStyle(fontSize: fontSizeExt.smallSize, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
