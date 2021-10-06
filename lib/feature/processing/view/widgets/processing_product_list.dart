import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class ProcessingProductList extends StatelessWidget {
  const ProcessingProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultSizeExt.baseBorderRadius),
        color: Color(0xFFF2F2F2),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("iPhone 13 Pro Max"),
                    Text("\$1500.00"),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("White, 6GB"),
                    Text("x1"),
                  ],
                ),
                Divider(
                  color: colorExt.LINE_COLOR,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
