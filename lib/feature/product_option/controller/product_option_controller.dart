import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class ProductOptionController extends GetxController {
  List<String> titleOptions = [
    "Option",
    "Ori-Price",
    "Sale",
    "QTY",
  ];

  final arg = Get.arguments;
  late AddProductBodyRequest addProductBodyRequest;

  TextEditingController oriPriceTextController = TextEditingController();
  TextEditingController salePriceTextController = TextEditingController();
  int qty = 0;

  FetchStatus fetchStatus = FetchStatus.idle;

  ProductService _service = ProductService();

  final AddMenuController addMenuController = Get.find<AddMenuController>();

  @override
  void onInit() {
    if (arg is AddProductBodyRequest) {
      addProductBodyRequest = arg;
    }

    super.onInit();
  }

  handleAddVariantType(String newType) {
    if (newType.isNotEmpty) {
      listProductOptions
          .add(AddProductOption(option: newType, productOptionValue: []));
      update();
    }
  }

  bool hideHintText = false;

  String getQtyFormat() {
    return "${addProductBodyRequest.productVariance}";
  }

  handleDecreaseQty(int index) {
    int intQty = int.parse(addProductVariance[index].quantity ?? "");
    if (intQty != 0) {
      intQty--;
      addProductVariance[index].quantity = intQty.toString();
      update();
    }
  }

  handleIncreaseQty(int index) {
    int intQty = int.parse(addProductVariance[index].quantity ?? "0");
    intQty++;
    addProductVariance[index].quantity = intQty.toString();
    update();
  }

  handleUpdateOriPrice(int index, String oriPrice) {
    addProductVariance[index].cost = oriPrice;
  }

  handleUpdateSalePrice(int index, String salePrice) {
    addProductVariance[index].price = salePrice;
  }

  handleHintText() {
    hideHintText = true;
    update();
  }

  handleRemoveVariantType(int index) {
    listProductOptions.removeAt(index);
    if (listProductOptions.isEmpty) {
      addProductVariance.clear();
    }
    update();
  }

  handleAddOptionVariant(int index, String option) {
    if (option.isNotEmpty) {
      listProductOptions[index].productOptionValue.add(
          AddProductOptionValue(optionValue: option, optionValueImageUrl: ""));
      update();
    }
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
    // productOptionVariances.clear();
    // addProductVariance.clear();
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

  handleAddProduct() async {
    addProductBodyRequest.productOptions = listProductOptions;
    addProductBodyRequest.productVariance = addProductVariance;

    fetchStatus = FetchStatus.loading;
    update();

    try {
      String imagePath = await uploadProductPhotos();

      if (imagePath.isNotEmpty) {
        addProductBodyRequest.image = imagePath;
        await _service.addProduct(addProductBodyRequest);

        fetchStatus = FetchStatus.complete;
        update();

        Get.offNamedUntil(Routes.SALE_MENU, (route) => false);
      }
    } catch (e) {
      print("Failed to Add Product: $e");
      fetchStatus = FetchStatus.error;
      update();
      if (e is ErrorResponse) {
        Get.snackbar("Can't Add Product", e.message.description);
      } else {
        if (e is DioError) {
          Get.snackbar("Something went wrong!", e.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    }

    //
    print("Add Product Body Request $addProductBodyRequest");
  }
}

extension on ProductOptionController {
  Future<String> uploadProductPhotos() async {
    String imagePath = "";

    try {
      for (var photo in addMenuController.photos) {
        final res = await _service.uploadImage(photo);
        if (res != null) {
          print("Product Upload Photo: ${res.results.path}");
          // addProductBodyRequest.image = res.results.path;
          imagePath = res.results.path;
        }
      }

      // addMenuController.photos.forEach((element) async {
      //   final res = await _service.uploadImage(element);
      //   if (res != null) {
      //     print("Product Upload Photo: ${res.results.path}");
      //     // addProductBodyRequest.image = res.results.path;
      //     imagePath = res.results.path;
      //   } else {
      //     print("GGWP");
      //   }
      // });
      return imagePath;
    } catch (e) {
      print("Failed to Upload Product Photo $e");
      return "";
    }
  }
}
