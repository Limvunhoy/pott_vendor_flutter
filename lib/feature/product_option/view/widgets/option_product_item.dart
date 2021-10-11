import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class OptionProductItem extends StatelessWidget {
  const OptionProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: defaultSizeExt.basePadding,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://img.freepik.com/free-vector/modern-black-friday-sale-banner-template-with-3d-background-red-splash_1361-1877.jpg?size=626&ext=jpg",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
            child: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "4K + Black = ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSizeExt.smallSize,
                    ),
                  ),
                  TextSpan(
                    text: "QTY 1",
                    style: TextStyle(
                      color: colorExt.LIGHT_GRAY,
                      fontSize: fontSizeExt.smallSize,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
