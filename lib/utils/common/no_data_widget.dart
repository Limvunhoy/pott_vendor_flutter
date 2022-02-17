import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key, required this.title, this.subtitle})
      : super(key: key);

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetPath.EMPTY_IMAGE,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width / 1.5,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            title,
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
            subtitle ?? "",
            style:
                TextStyle(fontSize: fontSizeExt.smallSize, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
