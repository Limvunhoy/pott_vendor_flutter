import 'package:get/get.dart';

class ProductOptionController extends GetxController {
  List<String> titleOptions = [
    "Option",
    "Ori-Price",
    "Sale",
    "QTY",
  ];

  List<String> variantTypes = [];
  // List<List<String>> productOptions = [];
  List<Map<String, List<String>>> productOptions =
      <Map<String, List<String>>>[];

  handleAddVariantType(String newType) {
    variantTypes.add(newType);

    productOptions.add({newType: []});
    print(productOptions);
    update();
  }

  handleRemoveVariantType(int index) {
    productOptions.removeAt(index);
    print("Product Option After Removed $productOptions");
    update();
  }

  handleAddOptionVariant(int index, String option) {
    productOptions[index].forEach((key, value) {
      value.add(option);
    });
    print(productOptions);
    update();
  }

  handleRemoveOption(index) {
    productOptions.forEach((element) {
      element.values.single.removeAt(index);
    });
    print(productOptions);
    update();
  }

  List<String> optionVariant(index) {
    List<String> options = [];
    productOptions[index].forEach((key, value) {
      List<String> list = List.castFrom(value);
      options = list;
    });
    return options;
  }

  List<String> types() {
    List<String> types = [];
    productOptions.forEach((element) {
      element.forEach((key, value) {
        types.add(key);
      });
    });
    return types;
  }

  String option(index) {
    return "";
  }

  String variantTypeFormat() {
    String format = "";
    variantTypes.forEach((element) {
      format = element;
    });
    return format;
  }
}
