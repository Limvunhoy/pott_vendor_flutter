import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/core/model/processing/processing_model.dart';
import 'package:pott_vendor/feature/processing/controller/processing_controller.dart';
import 'package:pott_vendor/utils/common/base_button.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget(
      {Key? key,
      required this.processingController,
      this.onConfirmNow,
      this.onOrderReady})
      : super(key: key);

  final ProcessingController processingController;
  final VoidCallback? onConfirmNow;
  final VoidCallback? onOrderReady;

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
                "\$ ${processingController.orderRecordItem?.totalPrice}",
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
          processingController.isButtonTapped == true
              ? Center(child: LoadingButton())
              : processingController.processingState ==
                      ProcessingState.processing
                  ? BaseButton(
                      width: MediaQuery.of(context).size.width,
                      height: 40.0,
                      onPressed: onConfirmNow,
                      title: "Confirm Now",
                      titleColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      backgroundColor: colorExt.PRIMARY_COLOR,
                    )
                  : processingController.processingState ==
                          ProcessingState.estimatedTime
                      ? BaseButton(
                          width: MediaQuery.of(context).size.width,
                          height: 40.0,
                          onPressed: onOrderReady,
                          title: "Order Ready",
                          titleColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          backgroundColor: colorExt.PRIMARY_COLOR,
                        )
                      : const SizedBox.shrink()
        ],
      ),
    );
  }
}
