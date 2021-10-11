import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/variant_item.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class VariantOptionTypeWidget extends StatelessWidget {
  const VariantOptionTypeWidget(
      {Key? key,
      this.isTopPadding = true,
      required this.titleType,
      this.isVariantType = false})
      : super(key: key);

  final bool? isTopPadding;
  final String titleType;
  final bool? isVariantType;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: isTopPadding == true
          ? const EdgeInsets.fromLTRB(defaultSizeExt.basePadding, 16.0,
              defaultSizeExt.basePadding, 20.0)
          : const EdgeInsets.fromLTRB(defaultSizeExt.basePadding, 0.0,
              defaultSizeExt.basePadding, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseTitleText(text: "$titleType"),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                defaultSizeExt.baseBorderRadius,
              ),
              border: Border.all(width: 1, color: colorExt.LINE_COLOR),
            ),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return VariantItem(
                    title: "Type",
                    backgroundColor: isVariantType == true
                        ? Color(0xFFF5F5F5)
                        : colorExt.PRIMARY_COLOR,
                    titleColor:
                        isVariantType == true ? Colors.black : Colors.white,
                    iconColor:
                        isVariantType == true ? Colors.black : Colors.white,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 3),
          ),
        ],
      ),
    );
  }
}
