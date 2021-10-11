import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';

class VariantItem extends StatelessWidget {
  const VariantItem({
    Key? key,
    required this.title,
    this.titleColor = Colors.white,
    this.backgroundColor = colorExt.PRIMARY_COLOR,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      labelPadding: const EdgeInsets.only(left: 8.0, right: 0.0),
      deleteIcon: Icon(
        Icons.close,
        color: iconColor,
        size: 14.0,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onDeleted: () {},
      label: BaseSmallText(
        text: "Type",
        color: titleColor,
      ),
    );
  }
}
