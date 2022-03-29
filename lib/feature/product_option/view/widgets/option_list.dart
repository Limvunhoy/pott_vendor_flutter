import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';
import 'package:pott_vendor/feature/product_option/controller/product_option_controller.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/option_list_item.dart';
import 'package:pott_vendor/feature/product_option/view/widgets/option_product_item.dart';
import 'package:pott_vendor/utils/common/base_extra_small_text.dart';
import 'package:pott_vendor/utils/common/base_small_text.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class OptionList extends StatelessWidget {
  OptionList({required this.controller});

  final ProductOptionController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          // headingRowColor:
          //     MaterialStateColor.resolveWith((states) => Colors.grey),

          headingRowHeight: 36.0,
          dataRowHeight: 40,
          headingTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Color(0xFFF5F5F5),
          ),
          columns: const <DataColumn>[
            DataColumn(
              label: BaseSmallText(
                text: 'Option',
                color: colorExt.LIGHT_GRAY,
              ),
            ),
            DataColumn(
              label: BaseSmallText(
                text: 'Ori-Price',
                color: colorExt.LIGHT_GRAY,
                textAlign: TextAlign.center,
              ),
            ),
            DataColumn(
              label: BaseSmallText(
                text: 'Sale Price',
                color: colorExt.LIGHT_GRAY,
              ),
            ),
            DataColumn(
              label: Expanded(
                child: BaseSmallText(
                  text: 'Qty',
                  color: colorExt.LIGHT_GRAY,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          dataRowColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          rows: controller.addProductVariance
              .asMap()
              .entries
              .map(
                (e) => DataRow(cells: [
                  // DataCell(Text("${controller.getOptionFormat(e)}")),
                  DataCell(Text("${e.value.combination}")),
                  DataCell(TextField(
                    // controller: controller.oriPriceTextController,
                    controller: controller.oriPriceTextControllers[e.key],
                    onChanged: (value) {
                      controller.handleUpdateOriPrice(e.key, value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "...",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefix: Text("\$"),
                    ),
                  )),
                  DataCell(TextField(
                    // controller: controller.salePriceTextController,
                    controller: controller.salePriceTextControllers[e.key],
                    onChanged: (value) {
                      controller.handleUpdateSalePrice(e.key, value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "...",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefix: Text("\$"),
                    ),
                  )),
                  DataCell(ConstrainedBox(
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
                              icon: Icons.remove,
                              onPressed: () {
                                controller.handleDecreaseQty(e.key);
                              })!,
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
                                text: e.value.quantity != null
                                    ? "${controller.addProductVariance[e.key].quantity}"
                                    : "0",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          customQTYButton(
                              icon: Icons.add,
                              isIncrease: true,
                              onPressed: () {
                                controller.handleIncreaseQty(e.key);
                              })!
                        ],
                      ),
                    ),
                  )),
                ]),
              )
              .toList(),

          // rows: controller.addProductVariance
          //     .map((e) => DataRow(cells: [
          //           // DataCell(Text("${controller.getOptionFormat(e)}")),
          //           DataCell(Text("${e.combination}")),
          //           DataCell(TextField(
          //             controller: controller.oriPriceTextController,
          //             decoration: InputDecoration(
          //               hintText: "...",
          //               focusedBorder: InputBorder.none,
          //               enabledBorder: InputBorder.none,
          //               errorBorder: InputBorder.none,
          //               prefix: Text("\$"),
          //             ),
          //           )),
          //           DataCell(TextField(
          //             controller: controller.salePriceTextController,
          //             decoration: InputDecoration(
          //               hintText: "...",
          //               focusedBorder: InputBorder.none,
          //               enabledBorder: InputBorder.none,
          //               errorBorder: InputBorder.none,
          //               prefix: Text("\$"),
          //             ),
          //           )),
          //           DataCell(ConstrainedBox(
          //             constraints: BoxConstraints(
          //               maxWidth: 65.0,
          //             ),
          //             child: Container(
          //               height: 19.64,
          //               alignment: Alignment.center,
          //               decoration: BoxDecoration(
          //                 color: Color(0xFFF9F9F9),
          //                 borderRadius: BorderRadius.circular(6.0),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   customQTYButton(
          //                       icon: Icons.remove,
          //                       onPressed: () {
          //                         controller.handleDecreaseQty(e);
          //                       })!,
          //                   Container(
          //                     width: 19.84,
          //                     decoration: BoxDecoration(
          //                       color: Color(0xFFF9F9F9),
          //                       border: Border.symmetric(
          //                         horizontal: BorderSide(
          //                             width: 0.5, color: colorExt.LINE_COLOR),
          //                       ),
          //                     ),
          //                     child: FittedBox(
          //                       fit: BoxFit.none,
          //                       child: BaseExtraSmallText(
          //                         textAlign: TextAlign.center,
          //                         text: e.quantity != null
          //                             ? "${controller.addProductBodyRequest}"
          //                             : "0",
          //                         color: Colors.black,
          //                       ),
          //                     ),
          //                   ),
          //                   customQTYButton(
          //                       icon: Icons.add,
          //                       isIncrease: true,
          //                       onPressed: () {
          //                         controller.handleIncreaseQty();
          //                       })!
          //                 ],
          //               ),
          //             ),
          //           )),
          //         ]))
          //     .toList(),
        ),
      ),
    );
  }

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

  /* @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appSizeExt.basePadding),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _controller.titleOptions
                  .map(
                    (e) => BaseSmallText(
                      text: "$e",
                      color: colorExt.LIGHT_GRAY,
                      textAlign: TextAlign.center,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            itemCount: 5,
            itemBuilder: (context, index) {
              return OptionListItem(
                index: index,
                onIncrease: () {
                  print("Increase QTY");
                },
                onDecrease: () {
                  print("Decrease QTY");
                },
              );
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 6.0,
              );
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return OptionProductItem();
            },
          ),
        ],
      ),
    );
  } */
}
