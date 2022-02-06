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

  bool hideHintText = false;

  handleHintText() {
    hideHintText = true;
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

  handleRemoveOption(int parentIndex, int index) {
    productOptions[parentIndex].values.single.removeAt(index);
    print(productOptions);
    update();
  }

  List<List<String>> generatedOptions = <List<String>>[];

  handleGenerateOptions() {
    generatedOptions.clear();
    update();

    List<List<String>> list = <List<String>>[];

    productOptions.forEach((element) {
      list.addAll(element.values);
    });

    var types = list[0].map((e) {
      return [e];
    });

    for (var i = 1; i < list.length; i++) {
      var next = [];
      types.forEach((item) {
        list[i].forEach((word) {
          List<String> line = item.sublist(0);
          line.add(word);
          next.add(line);
        });
      });
      types = next.map((e) => e);
    }
    generatedOptions.addAll(types);
    update();
  }

  String getOptionFormat(List<String> options) {
    String format = options.join("-");
    return format;
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
