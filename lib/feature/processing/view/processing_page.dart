import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/controller/processing_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/order_details_item.dart';
import 'package:pott_vendor/feature/processing/view/widgets/processing_product_list.dart';
import 'package:pott_vendor/model/processing/processing_model.dart';
import 'package:pott_vendor/utils/common/base_button.dart';
import 'package:pott_vendor/utils/common/base_view.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class ProcessingPage extends StatelessWidget {
  const ProcessingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final processingController = Get.find<ProcessingController>();

    var state = processingController.dummyData.value.state;

    return BaseView(
      backgroundColor: Colors.white,
      appBarBackgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Reject",
            style: TextStyle(
                color: colorExt.PRIMARY_COLOR,
                fontSize: fontSizeExt.mediumSize),
          ),
        )
      ],
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(defaultSizeExt.basePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    "${processingController.dummyData.value.title}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: defaultSizeExt.basePadding,
                ),
                Obx(
                  () => Text(
                    "${processingController.dummyData.value.subTitle}",
                    style: TextStyle(
                      color: colorExt.LIGHT_GRAY,
                      fontSize: fontSizeExt.mediumSize,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Image.asset(
                  ImagePathConstant.CONTACT_DRIVER_ICON,
                  fit: BoxFit.cover,
                  width: 96.0,
                  height: 96.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Obx(
                  () {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 15,
                          height: 3,
                          decoration: BoxDecoration(
                            color: state == ProcessingState.processing ||
                                    state == ProcessingState.estimatedTime ||
                                    state == ProcessingState.delivered
                                ? colorExt.PRIMARY_COLOR
                                : Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: 3,
                          decoration: BoxDecoration(
                            color: processingController.dummyData.value.state ==
                                        ProcessingState.estimatedTime ||
                                    processingController
                                            .dummyData.value.state ==
                                        ProcessingState.delivered
                                ? colorExt.PRIMARY_COLOR
                                : Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: 3,
                          decoration: BoxDecoration(
                            color:
                                (processingController.dummyData.value.state ==
                                                ProcessingState.estimatedTime ||
                                            processingController
                                                    .dummyData.value.state ==
                                                ProcessingState.delivered) &&
                                        processingController.timer!.tick >= 2
                                    ? colorExt.PRIMARY_COLOR
                                    : Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 15,
                          height: 3,
                          decoration: BoxDecoration(
                            color: processingController.dummyData.value.state ==
                                    ProcessingState.delivered
                                ? colorExt.PRIMARY_COLOR
                                : Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0FFF9),
                    border:
                        Border.all(width: 1.0, color: colorExt.PRIMARY_COLOR),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        ImagePathConstant.CONTACT_DRIVER_ICON,
                        fit: BoxFit.cover,
                        width: 45.0,
                        height: 45.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contact to driver",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: fontSizeExt.mediumSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Call ask about delivery",
                              style: TextStyle(
                                color: colorExt.LIGHT_GRAY,
                                fontSize: fontSizeExt.smallSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          ImagePathConstant.PHONE_ICON,
                          fit: BoxFit.cover,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Order Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSizeExt.mediumSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      OrderDetailItem(
                        title: "Order ID:",
                        value: "#12345",
                        valueColor: colorExt.PRIMARY_COLOR,
                        backgroundColor: Color(0xFFF0FFF9),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      OrderDetailItem(
                        title: "Order Date:",
                        value: "10-09-2021 | 9:00am",
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      OrderDetailItem(
                        title: "Delivery Address:",
                        value: "#35, St 310, Phnom Penh",
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      OrderDetailItem(
                        title: "Delivery Fee:",
                        value: "\$1.50",
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ProcessingProductList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigation: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 14.0, horizontal: defaultSizeExt.basePadding),
        height: 96.0 + MediaQuery.of(context).padding.bottom,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                      color: Colors.black, fontSize: fontSizeExt.smallSize),
                ),
                Text(
                  "\$ 1500.00",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSizeExt.largeSize,
                    fontWeight: fontWeightExt.baseFontWeight,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 13.0,
            ),
            Obx(
              () {
                return Visibility(
                  visible: processingController.dummyData.value.state !=
                      ProcessingState.delivered,
                  child: BaseButton(
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    onPressed: () {},
                    title: "Confirm Now",
                    titleColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    backgroundColor: colorExt.PRIMARY_COLOR,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
