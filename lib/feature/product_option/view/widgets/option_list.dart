import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/product_option/controller/product_option_controller.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/option_list_item.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/option_product_item.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class OptionList extends StatelessWidget {
  final ProductOptionController _controller =
      Get.find<ProductOptionController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultSizeExt.basePadding),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _controller.titleOptions
                  .map(
                    (e) => BaseSmallText(
                      text: "$e",
                      color: colorExt.LIGHT_GRAY,
                      textAlign: TextAlign.center,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            itemCount: 5,
            itemBuilder: (context, index) {
              return OptionListItem(
                index: index,
                onIncrease: () {
                  print("Increase QTY");
                },
                onDecrease: () {
                  print("Decrease QTY");
                },
              );
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 6.0,
              );
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return OptionProductItem();
            },
          ),
        ],
      ),
    );
  }
}
