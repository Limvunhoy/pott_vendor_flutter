import 'package:flutter/material.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/variant_item.dart';
import 'package:pott_vendor/utils/common/base_title_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class VariantOptionTypeWidget extends StatefulWidget {
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
  _VariantOptionTypeWidgetState createState() =>
      _VariantOptionTypeWidgetState();
}

class _VariantOptionTypeWidgetState extends State<VariantOptionTypeWidget> {
  List<String> _values = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: widget.isTopPadding == true
          ? const EdgeInsets.fromLTRB(
              appSizeExt.basePadding, 16.0, appSizeExt.basePadding, 20.0)
          : const EdgeInsets.fromLTRB(
              appSizeExt.basePadding, 0.0, appSizeExt.basePadding, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseTitleText(text: "${widget.titleType}"),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              padding: const EdgeInsets.all(5.0),
              // height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  appSizeExt.baseBorderRadius,
                ),
                border: Border.all(width: 1, color: colorExt.LINE_COLOR),
              ),
              child: TagEditor(
                length: _values.length,
                delimiters: [
                  ',',
                ],
                hasAddButton: false,
                inputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add tag...',
                ),
                onTagChanged: (newValue) {
                  setState(() {
                    _values.add(newValue);
                  });
                },
                tagBuilder: (context, index) => _Chip(
                  index: index,
                  label: _values[index],
                  onDeleted: (index) {},
                  isVariantType: widget.isVariantType,
                ),
              )
              /* ListView.separated(
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
                itemCount: 3), */
              ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
    this.isVariantType = false,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;
  final bool? isVariantType;

  @override
  Widget build(BuildContext context) {
    return VariantItem(
      title: label,
      backgroundColor:
          isVariantType == true ? Color(0xFFF5F5F5) : colorExt.PRIMARY_COLOR,
      titleColor: isVariantType == true ? Colors.black : Colors.white,
      iconColor: isVariantType == true ? Colors.black : Colors.white,
    );
    // return Chip(
    //   labelPadding: const EdgeInsets.only(left: 8.0),
    //   label: Text(label),
    //   deleteIcon: Icon(
    //     Icons.close,
    //     size: 18,
    //   ),
    //   onDeleted: () {
    //     onDeleted(index);
    //   },
    // );
  }
}
