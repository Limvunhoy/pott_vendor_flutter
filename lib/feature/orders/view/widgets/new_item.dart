import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pott_vendor/core/model/order/order_response.dart';
import 'package:pott_vendor/feature/orders/controller/orders_controller.dart';
import 'package:pott_vendor/feature/orders/view/widgets/new_product_option_item.dart';
import 'package:pott_vendor/utils/common/base_button.dart';
import 'package:pott_vendor/utils/constants/asset_path.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';
import 'package:pott_vendor/utils/helper/cache_image_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

enum OrderStatus { newOrder, ready, finished, competed }

class NewItem extends StatelessWidget {
  const NewItem({
    Key? key,
    required this.orderStatus,
    this.onConfirm,
    required this.orderRecord,
    required this.orderEnum,
    required this.orderTotal,
    this.onReject,
    this.onGoToOrderDetail,
    this.onOrderReady,
  }) : super(key: key);

  final OrderStatus orderStatus;
  final VoidCallback? onConfirm;
  final VoidCallback? onReject;
  final VoidCallback? onGoToOrderDetail;
  final VoidCallback? onOrderReady;
  final OrderRecordResponse orderRecord;
  final OrderType orderEnum;
  final String orderTotal;

  @override
  Widget build(BuildContext context) {
    String convertTimeAgo() {
      if (orderEnum == OrderType.newOrder) {
        return orderRecord.timeLine.newAt != null
            ? timeago.format(orderRecord.timeLine.newAt!)
            : "...";
      } else if (orderEnum == OrderType.readyOrder) {
        return orderRecord.timeLine.readyAt != null
            ? timeago.format(orderRecord.timeLine.readyAt!)
            : "...";
      } else {
        return orderRecord.timeLine.confirmAt != null
            ? timeago.format(orderRecord.timeLine.confirmAt!)
            : "...";
      }
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(appSizeExt.basePadding,
          appSizeExt.basePadding, appSizeExt.basePadding, 0),
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          appSizeExt.baseBorderRadius,
        ),
      ),
      child: Column(
        children: [
          // Delivery info
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35.0 / 2,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${orderRecord.delivery?.driverName ?? "N/A"}",
                      style: TextStyle(
                          fontSize: fontSizeExt.smallSize,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      convertTimeAgo(),
                      style: TextStyle(
                          fontSize: fontSizeExt.extraSmallSize,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              if (orderStatus == OrderStatus.ready ||
                  orderStatus == OrderStatus.finished) ...[
                Container(
                  margin: const EdgeInsets.only(top: 2.0),
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetPath.PHONE_ICON),
                    ),
                  ),
                ),
              ] else ...[
                GestureDetector(
                  onTap: onGoToOrderDetail,
                  child: Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    width: 14.0,
                    height: 14.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetPath.GO_ICON),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          // Product info
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // child: Image.network(
                  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqVmFDtPzb1NE0UOaixF8W7gQfqkwc5RFXRw&usqp=CAU",
                  //   // "${orderRecord.itemList.first.thumbnail.first}",
                  //   fit: BoxFit.cover,
                  //   width: 80.0,
                  //   height: 80.0,
                  // ),
                  child: CacheImageManager.cacheNetworkImage(
                      imageUrl: orderRecord.itemList.first.thumbnail.first,
                      width: 80.0,
                      height: 80.0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${orderRecord.itemList.first.name}",
                        style: TextStyle(fontSize: fontSizeExt.mediumSize),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "\$ ${orderRecord.itemList.first.productVariance.price} x ${orderRecord.itemList.first.qty}",
                        style: TextStyle(
                          fontSize: fontSizeExt.mediumSize,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 24.0,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return NewProductOptionItem(
                                varianceCombination: orderRecord
                                    .itemList.first.productVariance.combination,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 5.0,
                              );
                            },
                            itemCount: 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Total info
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: colorExt.LINE_COLOR),
                    bottom: BorderSide(color: colorExt.LINE_COLOR))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                          color: Colors.grey, fontSize: fontSizeExt.smallSize),
                    ),
                    Text(
                      "\$${orderRecord.totalPrice}",
                      style: TextStyle(
                          color: Colors.black, fontSize: fontSizeExt.smallSize),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(
                          color: Colors.grey, fontSize: fontSizeExt.smallSize),
                    ),
                    Text(
                      "\$${orderRecord.delivery?.amount ?? 0}",
                      style: TextStyle(
                          color: Colors.black, fontSize: fontSizeExt.smallSize),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: colorExt.LINE_COLOR),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order total:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSizeExt.smallSize,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$$orderTotal",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSizeExt.smallSize,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Buttons components
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.zero,
            child: orderStatus == OrderStatus.newOrder
                // ? Row(
                //     children: [
                //       Expanded(
                //         child: BaseButton(
                //           onPressed: onReject,
                //           title: "Reject",
                //           titleColor: colorExt.PRIMARY_COLOR,
                //           backgroundColor: Colors.white,
                //           borderColor: colorExt.PRIMARY_COLOR,
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 12.0,
                //       ),
                //       Expanded(
                //         child: BaseButton(
                //             onPressed: onConfirm,
                //             title: "Confirm",
                //             titleColor: Colors.white,
                //             backgroundColor: colorExt.PRIMARY_COLOR),
                //       ),
                //     ],
                //   )
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: BaseButton(
                        onPressed: onConfirm,
                        title: "Confirm",
                        titleColor: Colors.white,
                        backgroundColor: colorExt.PRIMARY_COLOR),
                  )
                : orderStatus == OrderStatus.ready
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: BaseButton(
                            onPressed: onOrderReady,
                            title: "Order Ready",
                            titleColor: Colors.white,
                            backgroundColor: colorExt.PRIMARY_COLOR),
                      )
                    : Container(
                        height: 38.0,
                      ),
          ),
        ],
      ),
    );
  }
}
