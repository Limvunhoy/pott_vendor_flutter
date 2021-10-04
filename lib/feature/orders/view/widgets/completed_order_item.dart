import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/common/base_button.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class CompletedOrderItem extends StatelessWidget {
  const CompletedOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        defaultSizeExt.basePadding,
        defaultSizeExt.basePadding,
        defaultSizeExt.basePadding,
        0,
      ),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultSizeExt.baseBorderRadius),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqVmFDtPzb1NE0UOaixF8W7gQfqkwc5RFXRw&usqp=CAU",
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: defaultSizeExt.basePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#123456",
                    style: TextStyle(
                      color: colorExt.PRIMARY_COLOR,
                      fontSize: fontSizeExt.mediumSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "1 Item",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSizeExt.smallSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "3 hours ago",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: fontSizeExt.smallSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          BaseButton(
            onPressed: () {},
            backgroundColor: colorExt.PRIMARY_COLOR,
            titleColor: Colors.white,
            title: "\$800.00",
          )
        ],
      ),
    );
  }
}
