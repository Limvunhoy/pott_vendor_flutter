import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/category/controller/category_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/product_option/view/export_widget.dart';

class ChooseCategoryPage extends GetWidget<CategoryController> {
  const ChooseCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarBackgroundColor: Colors.white,
      title: "Choose Category",
      body: GetBuilder(
          init: controller,
          builder: (_) {
            return Container(
              margin: const EdgeInsets.only(top: 10.0),
              color: Colors.white,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: colorExt.LINE_COLOR,
                    );
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        key: PageStorageKey(index),
                        leading: Image.network(
                          "https://purepng.com/public/uploads/large/purepng.com-photos-iconsymbolsiconsapple-iosiosios-8-iconsios-8-721522596102asedt.png",
                          fit: BoxFit.cover,
                          width: 44,
                        ),
                        title: BaseMediumText(
                          text: "Title",
                          fontWeight: FontWeight.w600,
                        ),
                        trailing: controller.isExpanded
                            ? Image.asset(
                                AssetPath.CATEGORY_ARROW_DOWN_ICON,
                                fit: BoxFit.cover,
                                width: 14.0,
                              )
                            : Image.asset(
                                AssetPath.CATEGORY_ARROW_RIGHT_ICON,
                                fit: BoxFit.cover,
                                width: 8.0,
                              ),
                        onExpansionChanged: (isExpanded) {
                          controller.handleExpanded(isExpanded);
                        },
                        children: List.generate(4, (index) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 45),
                            leading: Image.network(
                              "https://purepng.com/public/uploads/large/purepng.com-photos-iconsymbolsiconsapple-iosiosios-8-iconsios-8-721522596102asedt.png",
                              fit: BoxFit.cover,
                              width: 44,
                            ),
                            title: BaseMediumText(
                              text: "Child",
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
