import 'dart:developer';

import 'package:get/get.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';

class ProductOptionController extends GetxController {
  List<String> titleOptions = [
    "Option",
    "Ori-Price",
    "Sale",
    "QTY",
  ];

  // List<Map<String, List<String>>> productOptions =
  //     <Map<String, List<String>>>[];

  handleAddVariantType(String newType) {
    // productOptions.add({newType: []});
    listProductOptions
        .add(AddProductOption(option: newType, productOptionValue: []));
    // print(productOptions);
    update();
  }

  bool hideHintText = false;

  handleHintText() {
    hideHintText = true;
    update();
  }

  handleRemoveVariantType(int index) {
    // productOptions.removeAt(index);
    // print("Product Option After Removed $productOptions");
    listProductOptions.removeAt(index);
    update();
  }

  handleAddOptionVariant(int index, String option) {
    // productOptions[index].forEach((key, value) {
    //   value.add(option);
    // });

    listProductOptions[index].productOptionValue.add(
        AddProductOptionValue(optionValue: option, optionValueImageUrl: ""));
    // print(productOptions);
    update();
  }

  handleRemoveOption(int parentIndex, int index) {
    // productOptions[parentIndex].values.single.removeAt(index);
    listProductOptions[parentIndex].productOptionValue.removeAt(index);
    // print(productOptions);
    update();
  }

  List<List<String>> generatedOptions = <List<String>>[];

  List<AddProductOption> listProductOptions = <AddProductOption>[];
  // handleAddProductOptions() {
  //   print(listProductOptions.toString());
  //   // productOptions.forEach((element) {
  //   //   print(element.keys);
  //   // });
  // }

  List<AddProductVariance> addProductVariance = <AddProductVariance>[];
  List<List<AddProductOptionValue>> gg = <List<AddProductOptionValue>>[];

  handleGenerateProductOption() {
    List<List<String>> list = <List<String>>[];
    gg.clear();
    addProductVariance.clear();
    var type = listProductOptions[0].productOptionValue.map((e) => [e]);

    for (var i = 1; i < listProductOptions.length; i++) {
      var next = [];
      type.forEach((item) {
        listProductOptions[i].productOptionValue.forEach((word) {
          List<AddProductOptionValue> line = item.sublist(0);
          line.add(AddProductOptionValue(
              optionValue: word.optionValue, optionValueImageUrl: ""));
          next.add(line);
        });
      });
      type = next.map((e) => e);
      print("LOL: $type");

      gg.addAll(type);

      for (var i = 0; i < gg.length; i++) {
        List<String> wa = [];
        String combine = "";
        for (var j = 0; j < gg[i].length; j++) {
          wa.add(gg[i][j].optionValue);
          combine = wa.join("-");
        }
        addProductVariance.add(AddProductVariance(combination: combine));
      }

      update();
      print("GG ${addProductVariance.length}");
    }
  }

  // handleGenerateOptions() {
  //   generatedOptions.clear();
  //   update();
  //
  //   List<List<String>> list = <List<String>>[];
  //
  //   productOptions.forEach((element) {
  //     list.addAll(element.values);
  //   });
  //
  //   var types = list[0].map((e) {
  //     return [e];
  //   });
  //
  //   for (var i = 1; i < list.length; i++) {
  //     var next = [];
  //     types.forEach((item) {
  //       list[i].forEach((word) {
  //         List<String> line = item.sublist(0);
  //         line.add(word);
  //         next.add(line);
  //       });
  //     });
  //     types = next.map((e) => e);
  //   }
  //
  //   generatedOptions.addAll(types);
  //   update();
  // }

  String getOptionFormat(List<String> options) {
    String format = options.join("-");
    return format;
  }

  // List<String> optionVariant(index) {
  //   List<String> options = [];
  //   productOptions[index].forEach((key, value) {
  //     List<String> list = List.castFrom(value);
  //     options = list;
  //   });
  //   return options;
  // }

  // List<String> types() {
  //   List<String> types = [];
  //   productOptions.forEach((element) {
  //     element.forEach((key, value) {
  //       types.add(key);
  //     });
  //   });
  //   return types;
  // }

  String option(index) {
    return "";
  }
}
