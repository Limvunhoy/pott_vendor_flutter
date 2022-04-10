import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/core/model/category/category_response.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AddMenuController extends GetxController {
  RxString enteredText = "".obs;

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  ProductService _service = ProductService();

  final ImagePicker _imagePicker = ImagePicker();

  final int limitPhoto = 10;

  late AddProductBodyRequest addProductBodyRequest;

  // List<XFile>? selectedImages;
  CategoryResult? selectedCategory;

  counterText(String text) {
    enteredText.value = text;
  }

  final arg = Get.arguments;

  ProductRecord? saleProduct;

  bool isEdit = false;

  List<File> descriptionPhotos = [];
  List<File> photos = [];

  @override
  void onInit() {
    // if (arg is ProductRecord) {
    //   // saleProduct = arg;
    //   // debugPrint("Sale Product Image: ${saleProduct!.thumbnail.first}");
    //   _configAddProductBodyRequest(arg);
    // }
    if (arg != null) {
      isEdit = arg["isEdit"];
      _configAddProductBodyRequest(arg["productRecord"]);
    }

    super.onInit();
  }

  _configAddProductBodyRequest(ProductRecord productRecord) async {
    // List<AddProductOption> addProductOptions;
    //
    // addProductOptions = productRecord.productOptions.map((e) {
    //   return ProductOption(option: e.option, productOptionValue: )
    //   // return AddProductOption(option: e.option, productOptionValue: e.productOptionValue);
    // }).toList();

    // photos.add(File(productRecord.thumbnail.map((e) => e).toList()));
    titleTextController.text = productRecord.name;
    descriptionTextController.text = productRecord.description;
    addProductBodyRequest = AddProductBodyRequest(
      id: productRecord.id,
      name: productRecord.name,
      thumbnail: productRecord.thumbnail,
      images: productRecord.thumbnail,
      description: productRecord.description,
      categoryId: productRecord.category?.id ?? "",
      vendorId: productRecord.vendor?.vendorId ?? -1,
      productOptions: productRecord.productOptions,
      productVariance: productRecord.productVariance,
    );

    for (var path in productRecord.thumbnail) {
      photos.add(await urlToFile(path));
    }

    for (var path in productRecord.images) {
      descriptionPhotos.add(await urlToFile(path));
    }

    update();
  }

  Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = new Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }

  updateSelectedCategory(CategoryResult cate) {
    selectedCategory = cate;
    update();
  }

  photoPicker() async {
    try {
      List<XFile>? _selectedImages = await _imagePicker.pickMultiImage(
          maxWidth: 1920.0, maxHeight: 1080.0);
      if (_selectedImages!.isNotEmpty) {
        _selectedImages.forEach((element) {
          photos.add(File(element.path));
        });
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  photoCameraPicker() async {
    try {
      final _pic = await _imagePicker.pickImage(source: ImageSource.camera);
      if (_pic != null) {
        photos.add(File(_pic.path));
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  descriptionPhotoPicker() async {
    try {
      final _selectedImages = await _imagePicker.pickMultiImage(
          maxWidth: 1920.0, maxHeight: 1080.0);
      if (_selectedImages!.isNotEmpty) {
        _selectedImages.forEach((element) {
          descriptionPhotos.add(File(element.path));
        });
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  photoDescriptionCameraPicker() async {
    try {
      final _pic = await _imagePicker.pickImage(source: ImageSource.camera);
      if (_pic != null) {
        descriptionPhotos.add(File(_pic.path));
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  handleRemovePhoto(int index) {
    photos.removeAt(index);
    update();
  }

  handleRemoveDescriptionPhoto(int index) {
    descriptionPhotos.removeAt(index);
    update();
  }

  uploadProductPhotos() async {
    try {
      photos.forEach((element) async {
        final res = await _service.uploadImage(element);
        if (res != null) {
          print("Product Upload Photo: ${res.results.path}");
        }
      });
    } catch (e) {
      print("Failed to Upload Product Photo $e");
    }
  }

  AddProductBodyRequest handleContinue() {
    addProductBodyRequest = AddProductBodyRequest(
      name: titleTextController.text,
      thumbnail: [],
      images: [],
      description: descriptionTextController.text,
      categoryId: selectedCategory?.data.id ?? "",
      vendorId: -1,
      productOptions: [],
      productVariance: [],
    );

    return addProductBodyRequest;
  }
}
