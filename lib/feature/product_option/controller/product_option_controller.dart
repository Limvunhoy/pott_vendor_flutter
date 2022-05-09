import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/core/model/auth/user_response.dart';
import 'package:pott_vendor/core/model/error/error_response.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';
import 'package:pott_vendor/feature/add_menu/controller/add_menu_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/sale_menu/controller/sale_menu_controller.dart';
import 'package:pott_vendor/main.dart';
import 'package:pott_vendor/utils/constants/shared_preference_keys.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';
import 'package:pott_vendor/utils/helper/shared_preference_helper.dart';

class ProductOptionController extends GetxController {
  List<String> titleOptions = [
    "Option",
    "Ori-Price",
    "Sale",
    "QTY",
  ];

  final arg = Get.arguments;
  late AddProductBodyRequest addProductBodyRequest;
  bool isEdit = false;

  // TextEditingController oriPriceTextController = TextEditingController();
  // TextEditingController salePriceTextController = TextEditingController();
  List<TextEditingController> oriPriceTextControllers = [];
  List<TextEditingController> salePriceTextControllers = [];
  List<TextEditingController> qtyTextControllers = [];
  int qty = 0;

  FetchStatus fetchStatus = FetchStatus.idle;

  ProductService _service = ProductService();

  final AddMenuController addMenuController = Get.find<AddMenuController>();

  @override
  void onInit() {
    isEdit = arg["isEdit"];

    if (arg["bodyRequest"] != null &&
        arg["bodyRequest"] is AddProductBodyRequest) {
      addProductBodyRequest = arg["bodyRequest"];
      listProductOptions = addProductBodyRequest.productOptions;
      if (addProductBodyRequest.productOptions.isNotEmpty &&
          addProductBodyRequest.productVariance.isNotEmpty) {
        // handleGenerateNewProductOption();
        handleGenerateUpdateProductOption();
      }
    }

    debugPrint("Product Photos: ${addMenuController.photos.length}");
    debugPrint(
        "Product Description Photos: ${addMenuController.descriptionPhotos.length}");
    debugPrint(
        "Body Request Thumbnail: ${addProductBodyRequest.thumbnail.length}");
    debugPrint("Body Request Images: ${addProductBodyRequest.images.length}");
    super.onInit();
  }

  handleAddVariantType(String newType) {
    if (newType.isNotEmpty) {
      listProductOptions.add(
        // AddProductOption(
        //   option: newType,
        //   productOptionValue: [],
        // ),
        ProductOption(option: newType, productOptionValue: []),
      );
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

  handleUpdateQty(int index, String qty) {
    addProductVariance[index].quantity = qty;
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
            // AddProductOptionValue(optionValue: option, optionValueImageUrl: ""),
            ProductOptionValue(optionValue: option, optionValueImageUrl: ""),
          );
      update();
    }
  }

  handleRemoveOption(int parentIndex, int index) {
    listProductOptions[parentIndex].productOptionValue.removeAt(index);
    update();
  }

  // List<List<String>> generatedOptions = <List<String>>[];

  List<ProductOption> listProductOptions = <ProductOption>[];

  // List<AddProductVariance> addProductVariance = <AddProductVariance>[];
  // List<List<AddProductOptionValue>> productOptionVariances =
  //     <List<AddProductOptionValue>>[];
  List<ProductVariance> addProductVariance = <ProductVariance>[];
  List<List<ProductOptionValue>> productOptionVariances =
      <List<ProductOptionValue>>[];

  handleGenerateUpdateProductOption() {
    // productOptionVariances.clear();
    // addProductVariance.clear();

    debugPrint(
        "Update Product Body Request: ${addProductBodyRequest.toString()}");

    var type = listProductOptions[0].productOptionValue.map((e) => [e]);

    for (var i = 1; i < listProductOptions.length; i++) {
      var next = [];
      type.forEach((item) {
        listProductOptions[i].productOptionValue.forEach((word) {
          // List<AddProductOptionValue> line = item.sublist(0);
          List<ProductOptionValue> line = item.sublist(0);
          // line.add(
          //   AddProductOptionValue(
          //       optionValue: word.optionValue, optionValueImageUrl: ""),
          // );
          line.add(
            ProductOptionValue(
                optionValue: word.optionValue,
                optionValueImageUrl: word.optionValueImageUrl),
          );
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
        // addProductVariance
        //     .add(ProductVariance(combination: combine, imageUrl: ""));
        oriPriceTextControllers.add(TextEditingController());
        salePriceTextControllers.add(TextEditingController());
        qtyTextControllers.add(TextEditingController());

        if (addProductBodyRequest.productVariance.isNotEmpty) {
          addProductVariance.add(
            ProductVariance(
              combination: combine,
              cost: addProductBodyRequest.productVariance[i].cost,
              price: addProductBodyRequest.productVariance[i].price,
              quantity: addProductBodyRequest.productVariance[i].quantity,
              imageUrl: "",
            ),
          );

          oriPriceTextControllers[i].text =
              addProductBodyRequest.productVariance[i].cost ?? "";
          salePriceTextControllers[i].text =
              addProductBodyRequest.productVariance[i].price ?? "";
          qtyTextControllers[i].text =
              addProductBodyRequest.productVariance[i].quantity ?? "0";
        } else {
          addProductVariance
              .add(ProductVariance(combination: combine, imageUrl: ""));
        }

        print(
            "OriPrice TextControllers Length: ${addProductBodyRequest.productVariance[i].quantity}");

        // handleUpdateSalePrice(
        //     i, addProductBodyRequest.productVariance[i].cost ?? "");
        // handleUpdateOriPrice(
        //     i, addProductBodyRequest.productVariance[i].price ?? "");
      }

      update();
      print("GG ${addProductVariance.length}");
    }
  }

  handleGenerateNewProductOption() {
    // productOptionVariances.clear();
    // addProductVariance.clear();
    var type = listProductOptions[0].productOptionValue.map((e) => [e]);

    for (var i = 1; i < listProductOptions.length; i++) {
      var next = [];
      type.forEach((item) {
        listProductOptions[i].productOptionValue.forEach((word) {
          List<ProductOptionValue> line = item.sublist(0);
          line.add(ProductOptionValue(
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

        oriPriceTextControllers.add(TextEditingController());
        salePriceTextControllers.add(TextEditingController());
        qtyTextControllers.add(TextEditingController());

        addProductVariance
            .add(ProductVariance(combination: combine, imageUrl: ""));
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

  Future<bool> handleAddProduct() async {
    addProductBodyRequest.productOptions = listProductOptions;
    addProductBodyRequest.productVariance = addProductVariance;

    fetchStatus = FetchStatus.loading;
    update();

    try {
      await getUserFromSharedPreference();

      await uploadProductPhotos();

      await uploadPhotoDescription();
      // addProductBodyRequest.thumnail = await uploadProductPhotos();

      print("Add Product Body Request $addProductBodyRequest");

      await _service.addProduct(addProductBodyRequest);

      fetchStatus = FetchStatus.complete;
      update();

      return true;

      Get.offNamedUntil(Routes.SALE_MENU, (route) => false);
    } catch (e) {
      print("Failed to Add Product: ${e.runtimeType}");
      fetchStatus = FetchStatus.error;
      update();
      if (e is ErrorResponse) {
        Get.snackbar("Can't Add Product", e.message.description);
      } else {
        if (e is DioError) {
          Get.snackbar("Something went wrong!", e.message,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "$e", snackPosition: SnackPosition.BOTTOM);
        }
      }
      return false;
    }
  }

  var saleController = Get.find<SaleMenuController>();
  Future<bool> handleUpdateProduct() async {
    // fetchStatus = FetchStatus.loading;
    // update();

    // Get.showOverlay(
    //     asyncFunction: () async {
    //       // await Future.delayed(Duration(seconds: 5));
    //       List<ProductRecord> records = [];
    //       await saleController.queryProduct("sell", 1, false, records);
    //     },
    //     loadingWidget: Center(
    //       child: CircularProgressIndicator(
    //         color: colorExt.PRIMARY_COLOR,
    //       ),
    //     ));
    // debugPrint(
    //     "Update Product Body Request: ${addProductBodyRequest.toString()}");
    try {
      await uploadProductPhotos();
      await uploadPhotoDescription();

      debugPrint(
          "BodyRequest Product Photos: ${addProductBodyRequest.thumbnail.length}");
      debugPrint(
          "BodyRequest Product Photos: ${addProductBodyRequest.images.length}");
      await _service.updateProduct(addProductBodyRequest);
      // fetchStatus = FetchStatus.complete;
      // update();
      return true;
    } catch (e) {
      debugPrint(
          "Failed to Update Product with ID: ${addProductBodyRequest.id}, error: $e");
      if (e is ErrorResponse) {
        Get.snackbar("Something went wrong!", e.message.description,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        if (e is DioError) {
          Get.snackbar("Something went wrong!", e.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    }

    return false;
  }
}

extension on ProductOptionController {
  getUserFromSharedPreference() async {
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    UserDataResponse currentUser = UserDataResponse.fromJson(
        await sharedPreferenceHelper.read(SharedPreferenceKey.user));

    addProductBodyRequest.vendorId = currentUser.vendorId;
  }

  // Future<String> uploadProductPhotos() async {
  //   String imagePath = "";
  //
  //   try {
  //     for (var photo in addMenuController.photos) {
  //       final res = await _service.uploadImage(photo);
  //       if (res != null) {
  //         print("Product Upload Photo: ${res.results.path}");
  //         imagePath = res.results.path;
  //       }
  //     }
  //     return imagePath;
  //   } catch (e) {
  //     print("Failed to Upload Product Photo $e");
  //     return "";
  //   }
  // }
  uploadProductPhotos() async {
    try {
      for (var photo in addMenuController.photos) {
        if (photo is File) {
          final res = await _service.uploadImage(photo);
          if (res != null) {
            addProductBodyRequest.thumbnail.add(res.results.path);
          }
        }
      }
    } catch (e) {
      debugPrint("Failed to Upload Product Photo: $e");
    }
  }

  uploadPhotoDescription() async {
    // List<String> images = [];

    try {
      for (var photo in addMenuController.descriptionPhotos) {
        print("Loop Description Photos");
        if (photo is File) {
          final res = await _service.uploadImage(photo);
          if (res != null) {
            print("Product Description Photo: ${res.results.path}");
            addProductBodyRequest.images.add(res.results.path);
          }
        }
      }
      // return images;
    } catch (e) {
      print("Failed to Upload Product Photo $e");
      // return [];
    }
  }
}
