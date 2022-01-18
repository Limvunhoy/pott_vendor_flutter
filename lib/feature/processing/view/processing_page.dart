import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/processing/processing_model.dart';
import 'package:pott_vendor/feature/processing/controller/processing_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/bottom_navigation_widget.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/common/alert_popup.dart';

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
          onPressed: () {
            AppDialog.showAppDialog(context, onClose: () {
              Get.back();
            }, onConfirm: () {
              // TODO: Handle reject order
            });
          },
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
            padding: const EdgeInsets.all(appSizeExt.basePadding),
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
                  height: appSizeExt.basePadding,
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
                  AssetPath.DRIVER_ICON,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 3.7,
                  height: MediaQuery.of(context).size.width / 3.5,
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
                        AssetPath.CONTACT_DRIVER_ICON,
                        fit: BoxFit.cover,
                        width: 45.0,
                        height: 45.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ContactDriverWidget(),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          AssetPath.PHONE_ICON,
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
                      OrderDetailsWidget(
                        orderItem: processingController.orderRecordItem!,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ProcessingProductList(
                        orderItemList:
                            processingController.orderRecordItem?.itemList ??
                                [],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigation: BottomNavigationWidget(
        processingController: processingController,
      ),
    );
  }
}
