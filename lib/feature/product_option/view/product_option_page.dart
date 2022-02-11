import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pott_vendor/feature/product_option/controller/product_option_controller.dart';
import 'package:pott_vendor/feature/product_option/view/export_widget.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/variant_type.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class ProductOptionPage extends GetWidget<ProductOptionController> {
  const ProductOptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardContent(
      child: GetBuilder(
          init: controller,
          builder: (_) {
            return LoadingOverlay(
              isLoading:
                  controller.fetchStatus == FetchStatus.loading ? true : false,
              progressIndicator: CircularProgressIndicator(
                color: colorExt.PRIMARY_COLOR,
              ),
              color: Colors.black,
              child: BaseView(
                title: "Product Option",
                titleColor: Colors.black,
                appBarBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      VariantTypeWidget(
                        items: controller.listProductOptions,
                        onSubmitted: (newType) {
                          controller.handleAddVariantType(newType);
                        },
                        onDeleted: (index) {
                          controller.handleRemoveVariantType(index);
                        },
                      ),
                      Container(
                        color: Color(0xFFF5F5F5),
                        height: 10,
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: controller.listProductOptions.length,
                        itemBuilder: (context, index) {
                          return VariantOptionWidget(
                            titleType:
                                "${controller.listProductOptions[index].option}",
                            controller: controller,
                            // items: controller.optionVariant(index),
                            items: controller
                                .listProductOptions[index].productOptionValue,
                            isTopPadding: index != 0 ? false : true,
                            onSubmitted: (newValue) {
                              controller.handleAddOptionVariant(
                                  index, newValue);
                            },
                            onDeleted: (deletedIndex) {
                              print(index);
                              controller.handleRemoveOption(
                                  index, deletedIndex);
                            },
                          );
                        },
                      ),
                      Container(
                        color: Color(0xFFF5F5F5),
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        child: TextButton(
                          onPressed: controller.listProductOptions
                                  .map((e) => e.productOptionValue)
                                  .toList()
                                  .isNotEmpty
                              ? () {
                                  // controller.handleGenerateOptions();
                                  // controller.handleAddProductOptions();
                                  controller.handleGenerateProductOption();
                                }
                              : null,
                          style: TextButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 49.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: controller.listProductOptions
                                        .map((e) => e.productOptionValue)
                                        .toList()
                                        .isNotEmpty
                                    ? colorExt.PRIMARY_COLOR
                                    : colorExt.LINE_COLOR,
                              ),
                              const SizedBox(
                                width: 7.0,
                              ),
                              BaseMediumText(
                                text: "Generate Option",
                                color: controller.listProductOptions
                                        .map((e) => e.productOptionValue)
                                        .toList()
                                        .isNotEmpty
                                    ? colorExt.PRIMARY_COLOR
                                    : colorExt.LINE_COLOR,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xFFF5F5F5),
                        height: 10,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      OptionList(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
                bottomNavigation: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(appSizeExt.basePadding),
                    child: BaseButton(
                        height: 40.0,
                        title: "Create",
                        titleColor: Colors.white,
                        backgroundColor: colorExt.PRIMARY_COLOR,
                        onPressed: controller.addProductVariance.isNotEmpty
                            ? () {
                                controller.handleAddProduct();
                              }
                            : null),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
