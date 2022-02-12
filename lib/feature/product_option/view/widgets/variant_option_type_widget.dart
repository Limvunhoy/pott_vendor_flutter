import 'package:flutter/material.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';
import 'package:pott_vendor/feature/product_option/controller/product_option_controller.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/variant_item.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class VariantOptionWidget extends StatelessWidget {
  const VariantOptionWidget({
    Key? key,
    required this.titleType,
    required this.controller,
    this.items,
    this.isTopPadding = false,
    required this.onSubmitted,
    required this.onDeleted,
  }) : super(key: key);

  final String titleType;
  final ProductOptionController controller;
  final List<AddProductOptionValue>? items;
  final bool isTopPadding;
  final Function(String) onSubmitted;
  final Function(int) onDeleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: isTopPadding == true
          ? const EdgeInsets.fromLTRB(
              appSizeExt.basePadding, 16.0, appSizeExt.basePadding, 20.0)
          : const EdgeInsets.fromLTRB(
              appSizeExt.basePadding, 0.0, appSizeExt.basePadding, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseTitleText(text: "$titleType"),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  appSizeExt.baseBorderRadius,
                ),
                border: Border.all(width: 1, color: colorExt.LINE_COLOR),
              ),
              child: TagEditor(
                length: items == null ? 0 : items!.length,
                delimiters: [
                  ',',
                  '.',
                  ' ',
                ],
                onSubmitted: (newValue) {
                  onSubmitted(newValue);
                },
                resetTextOnSubmitted: true,
                tagSpacing: 0.0,
                hasAddButton: false,
                inputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add tag...',
                  contentPadding: const EdgeInsets.only(bottom: 5.5, left: 5.0),
                  isDense: false,
                ),
                onTagChanged: (newValue) {
                  // controller.handleAddVariantType(newValue);
                  onSubmitted(newValue);
                },
                tagBuilder: (context, index) => _Chip(
                  label: items?[index].optionValue ?? "",
                  onDeleted: () {
                    onDeleted(index);
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    this.label,
    required this.onDeleted,
  });

  final String? label;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return VariantItem(
      title: label,
      backgroundColor: Color(0xFFF5F5F5),
      titleColor: Colors.black,
      iconColor: Colors.black,
      onDeleted: onDeleted,
    );
  }
}
