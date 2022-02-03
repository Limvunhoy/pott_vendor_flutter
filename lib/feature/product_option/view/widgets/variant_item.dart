import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';

class VariantItem extends StatelessWidget {
  const VariantItem({
    Key? key,
    this.title,
    this.titleColor = Colors.white,
    this.backgroundColor = colorExt.PRIMARY_COLOR,
    this.iconColor = Colors.white,
    required this.onDeleted,
  }) : super(key: key);

  final String? title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
      child: title == null
          ? const SizedBox.shrink()
          : Chip(
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
              onDeleted: onDeleted,
              label: BaseSmallText(
                text: title!,
                color: titleColor,
              ),
            ),
    );
  }
}
