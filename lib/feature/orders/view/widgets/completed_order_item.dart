import 'package:flutter/material.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/utils/common/base_button.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';
import 'package:pott_vendor/utils/helper/cache_image_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

class CompletedOrderItem extends StatelessWidget {
  const CompletedOrderItem(
      {Key? key, required this.orderRecordResponse, required this.item})
      : super(key: key);

  final OrderRecordResponse orderRecordResponse;
  final String item;

  @override
  Widget build(BuildContext context) {
    String convertTimeAgo() {
      return orderRecordResponse.timeLine.completedAt != null
          ? timeago.format(orderRecordResponse.timeLine.completedAt!)
          : "...";
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(appSizeExt.baseBorderRadius),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // child: Image.network(
            //   // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqVmFDtPzb1NE0UOaixF8W7gQfqkwc5RFXRw&usqp=CAU",
            //   "${orderRecordResponse.itemList.first.thumbnail.first}",
            //   fit: BoxFit.cover,
            //   width: 80.0,
            //   height: 80.0,
            // ),
            child: CacheImageManager.cacheNetworkImage(
                imageUrl: orderRecordResponse.itemList.first.thumbnail.first,
                width: 80.0,
                height: 80.0),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: appSizeExt.basePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${orderRecordResponse.displayId}",
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
                    item,
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
                    convertTimeAgo(),
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
            title: "\$${orderRecordResponse.totalPrice}",
          )
        ],
      ),
    );
  }
}
