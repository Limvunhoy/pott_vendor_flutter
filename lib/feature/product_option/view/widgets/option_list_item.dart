import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/common/base_extra_small_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';

class OptionListItem extends StatelessWidget {
  const OptionListItem(
      {Key? key,
      required this.index,
      required this.onIncrease,
      required this.onDecrease})
      : super(key: key);

  final int index;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BaseSmallText(
                  text: "Option ${index + 1}",
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: BaseSmallText(
                  text: "\$...",
                  textAlign: TextAlign.center,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: BaseSmallText(
                  text: "\$...",
                  textAlign: TextAlign.center,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 65.0,
                ),
                child: Container(
                  height: 19.64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customQTYButton(
                          icon: Icons.remove, onPressed: onDecrease)!,
                      Container(
                        width: 19.84,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          border: Border.symmetric(
                            horizontal: BorderSide(
                                width: 0.5, color: colorExt.LINE_COLOR),
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: BaseExtraSmallText(
                            textAlign: TextAlign.center,
                            text: "1",
                            color: Colors.black,
                          ),
                        ),
                      ),
                      customQTYButton(
                          icon: Icons.add,
                          isIncrease: true,
                          onPressed: onIncrease)!
                    ],
                  ),
                ),
              )
            ],
          ),

          /// check if length of the items - 1
          if (index < 5 - 1) ...{
            Divider(
              color: colorExt.LINE_COLOR,
            ),
          }
        ],
      ),
    );
  }
}

// Reusable Widget
extension on OptionListItem {
  Widget? customQTYButton(
      {required IconData icon,
      bool? isIncrease = false,
      required VoidCallback onPressed}) {
    return Container(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        maxWidth: 21.79,
      ),
      decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          border: Border.all(width: 0.5, color: colorExt.LINE_COLOR),
          borderRadius: isIncrease == true
              ? BorderRadius.only(
                  topRight: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                )),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 16.0,
        ),
      ),
    );
  }
}
