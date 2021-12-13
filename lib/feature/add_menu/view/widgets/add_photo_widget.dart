import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({
    Key? key,
    required this.frameWidth,
    required this.frameHeight,
    required this.iconWidth,
    required this.iconHeight,
    required this.fontSize,
    required this.onTap,
  }) : super(key: key);

  final double frameWidth;
  final double frameHeight;
  final double iconWidth;
  final double iconHeight;
  final double fontSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: frameWidth,
        height: frameHeight,
        decoration: BoxDecoration(
          color: Color(0xFFE9E9E9),
          borderRadius: BorderRadius.circular(appSizeExt.baseBorderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(appSizeExt.baseBorderRadius),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetPath.ADD_PHOTO_ICON,
                fit: BoxFit.cover,
                width: iconWidth,
                height: iconHeight,
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                "Add Photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  color: colorExt.DARK_GRAY,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
