import 'package:get/get.dart';

class ProductOptionController extends GetxController {
  List<String> titleOptions = [
    "Option",
    "Ori-Price",
    "Sale",
    "QTY",
  ];

  List<String> variantTypes = [];
  List<List<String>> productOptions = [];

  handleAddVariantType(String newType) {
    variantTypes.add(newType);
    update();
  }

  handleRemoveVariantType(int index) {
    variantTypes.removeAt(index);
    update();
  }

  handleAddOptionVariant(int index, String option) {}

  String variantTypeFormat() {
    String format = "";
    variantTypes.forEach((element) {
      format = element;
    });
    return format;
  }
}
