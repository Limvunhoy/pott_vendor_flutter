import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/processing/processing_model.dart';
import 'package:pott_vendor/feature/processing/controller/processing_controller.dart';
import 'package:pott_vendor/utils/common/base_button.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key, required this.processingController})
      : super(key: key);

  final ProcessingController processingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 14.0, horizontal: appSizeExt.basePadding),
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
                "\$ ${processingController.orderRecordItem?.totalPrice ?? 0}",
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
                  onPressed: () {
                    processingController.handleConfirmOrder();
                  },
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
    );
  }
}
