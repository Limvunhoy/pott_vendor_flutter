import 'package:get/get.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';

class ProductOptionController extends GetxController {
  List<String> titleOptions = [
    "Option",
    "Ori-Price",
    "Sale",
    "QTY",
  ];

  handleAddVariantType(String newType) {
    listProductOptions
        .add(AddProductOption(option: newType, productOptionValue: []));
    update();
  }

  bool hideHintText = false;

  handleHintText() {
    hideHintText = true;
    update();
  }

  handleRemoveVariantType(int index) {
    listProductOptions.removeAt(index);
    update();
  }

  handleAddOptionVariant(int index, String option) {
    listProductOptions[index].productOptionValue.add(
        AddProductOptionValue(optionValue: option, optionValueImageUrl: ""));
    update();
  }

  handleRemoveOption(int parentIndex, int index) {
    listProductOptions[parentIndex].productOptionValue.removeAt(index);
    update();
  }

  // List<List<String>> generatedOptions = <List<String>>[];

  List<AddProductOption> listProductOptions = <AddProductOption>[];

  List<AddProductVariance> addProductVariance = <AddProductVariance>[];
  List<List<AddProductOptionValue>> productOptionVariances =
      <List<AddProductOptionValue>>[];

  handleGenerateProductOption() {
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

      productOptionVariances.addAll(type);

      for (var i = 0; i < productOptionVariances.length; i++) {
        List<String> wa = [];
        String combine = "";
        for (var j = 0; j < productOptionVariances[i].length; j++) {
          wa.add(productOptionVariances[i][j].optionValue);
          combine = wa.join("-");
        }
        addProductVariance.add(AddProductVariance(combination: combine));
      }

      update();
      print("GG ${addProductVariance.length}");
    }
  }

  String getOptionFormat(List<String> options) {
    String format = options.join("-");
    return format;
  }

  String option(index) {
    return "";
  }
}
