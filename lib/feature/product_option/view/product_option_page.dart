import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/product_option/view/export_widget.dart';

class ProductOptionPage extends StatelessWidget {
  const ProductOptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Product Option",
      titleColor: Colors.black,
      appBarBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VariantOptionTypeWidget(
              titleType: "Choose Variation Type",
            ),
            // TODO: Type
            Container(
              color: Color(0xFFF5F5F5),
              height: 10,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: false,
              itemCount: 2,
              itemBuilder: (context, index) {
                return VariantOptionTypeWidget(
                  titleType: "Type:",
                  isVariantType: true,
                  isTopPadding: index != 0 ? false : true,
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
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 59.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: colorExt.PRIMARY_COLOR,
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    BaseMediumText(
                      text: "Generate Option",
                      color: colorExt.PRIMARY_COLOR,
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
            OptionList(),
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
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
