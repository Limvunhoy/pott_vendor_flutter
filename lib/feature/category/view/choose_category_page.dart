import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/category/controller/category_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/product_option/view/export_widget.dart';
import 'package:pott_vendor/utils/common/loading_widget.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

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
            return controller.fetchStatus == FetchStatus.loading
                ? LoadingWidget()
                : controller.fetchStatus == FetchStatus.error
                    ? Center(
                        child: BaseMediumText(
                          text: "No Data",
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        color: Colors.white,
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: colorExt.LINE_COLOR,
                              );
                            },
                            itemCount: controller.getCategoryCount(),
                            itemBuilder: (context, index) {
                              return Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                    key: PageStorageKey(index),
                                    leading: Image.network(
                                      controller.categoryImage(index),
                                      fit: BoxFit.cover,
                                      width: 44,
                                    ),
                                    title: BaseMediumText(
                                      text: controller
                                          .categoryParentNameFormat(index),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    trailing: controller.categories![index]
                                            .children.isNotEmpty
                                        ? controller.isExpanded
                                            ? Image.asset(
                                                AssetPath
                                                    .CATEGORY_ARROW_DOWN_ICON,
                                                fit: BoxFit.cover,
                                                width: 14.0,
                                              )
                                            : Image.asset(
                                                AssetPath
                                                    .CATEGORY_ARROW_RIGHT_ICON,
                                                fit: BoxFit.cover,
                                                width: 8.0,
                                              )
                                        : const SizedBox.shrink(),
                                    onExpansionChanged: (isExpanded) {
                                      controller.handleExpanded(isExpanded);
                                    },
                                    children: controller
                                            .categories?[index].children
                                            .map((e) {
                                          return ListTile(
                                            onTap: () {
                                              Get.back(result: e);
                                            },
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 45),
                                            leading: Image.network(
                                              controller.subCategoryImage(
                                                  e.data.icon),
                                              fit: BoxFit.cover,
                                              width: 44,
                                            ),
                                            title: BaseMediumText(
                                              text: e.data.nameEn,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        }).toList() ??
                                        []),
                              );
                            }),
                      );
          }),
    );
  }
}
