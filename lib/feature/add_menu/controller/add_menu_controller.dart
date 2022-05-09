import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

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
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AddMenuController extends GetxController {
  RxString enteredText = "".obs;

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  ProductService _service = ProductService();

  final ImagePicker _imagePicker = ImagePicker();

  // final int limitPhoto = 10;

  late AddProductBodyRequest addProductBodyRequest;

  // List<XFile>? selectedImages;
  CategoryResult? selectedCategory;

  counterText(String text) {
    enteredText.value = text;
  }

  final arg = Get.arguments;

  ProductRecord? saleProduct;

  bool isEdit = false;

  int maxPhoto = 10;
  int maxPhotoDescription = 10;

  // List<File> descriptionPhotos = [];
  // List<File> photos = [];
  List photos = [];
  List descriptionPhotos = [];
  // List photoFiles = [];
  // List descriptionPhotoFiles = [];

  ItemScrollController photoListItemScrollController = ItemScrollController();
  ItemScrollController photoDescriptionListItemScrollController =
      ItemScrollController();

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
      images: productRecord.images ?? [],
      description: productRecord.description,
      categoryId: productRecord.category?.id ?? "",
      vendorId: productRecord.vendor?.vendorId ?? -1,
      productOptions: productRecord.productOptions,
      productVariance: productRecord.productVariance,
    );

    photos = productRecord.thumbnail;
    descriptionPhotos = productRecord.images ?? [];

    // for (var path in productRecord.thumbnail) {
    //   // photos.add(await urlToFile(path));
    //   // final ByteData imageData =
    //   //     await NetworkAssetBundle(Uri.parse(path)).load("");
    //   // final Uint8List bytes = imageData.buffer.asUint8List();
    //   photos.add(path);
    //   // photos.add(path);
    // }

    // if (productRecord.images != null) {
    //   for (var path in productRecord.images!) {
    //     // descriptionPhotos.add(await urlToFile(path));
    //     descriptionPhotos.add(path);
    //   }
    // }

    update();
  }

  Future<Uint8List> covertToBytes(String url) async {
    final ByteData imageData =
        await NetworkAssetBundle(Uri.parse(url)).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
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
        _selectedImages.forEach((element) async {
          photos.add(File(element.path));
          // photoFiles.add(File(element.path));
          // photoFiles.add(File(element.path));
          // Uint8List bytes = element.readAsBytes() as Uint8List;

          // photoFiles.add(await convertFileToBytes(element));

          // photos = photos + photoFiles;
        });
        // photos = _selectedImages
        //     .map((e) async => await convertFileToBytes(e))
        //     .toList();

        // photos.addAll(photoFiles);
        if (photos.isNotEmpty) {
          photoListItemScrollController.scrollTo(
              index: photos.length - 1, duration: Duration(milliseconds: 300));
        }
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  Future<Uint8List> convertFileToBytes(XFile file) async {
    Uint8List bytes = await file.readAsBytes();
    return bytes;
  }

  photoCameraPicker() async {
    try {
      final _pic = await _imagePicker.pickImage(source: ImageSource.camera);
      if (_pic != null) {
        photos.add(File(_pic.path));
        // photoFiles.add(await convertFileToBytes(_pic));
        // photos = photos + photoFiles;

        if (photos.isNotEmpty) {
          photoListItemScrollController.scrollTo(
            index: photos.length - 1,
            duration: Duration(milliseconds: 300),
          );
        }

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
        _selectedImages.forEach((element) async {
          descriptionPhotos.add(File(element.path));
          // descriptionPhotoFiles.add(await convertFileToBytes(element));

          // descriptionPhotos = descriptionPhotos + descriptionPhotoFiles;
        });

        if (descriptionPhotos.isNotEmpty) {
          photoDescriptionListItemScrollController.scrollTo(
              index: descriptionPhotos.length - 1,
              duration: Duration(milliseconds: 300));
        }
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
        // descriptionPhotoFiles.add(await convertFileToBytes(_pic));
        // descriptionPhotos = descriptionPhotos + descriptionPhotoFiles;

        if (descriptionPhotos.isNotEmpty) {
          photoDescriptionListItemScrollController.scrollTo(
              index: descriptionPhotos.length - 1,
              duration: Duration(milliseconds: 300));
        }
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
    // descriptionPhotos.removeAt(index);
    // if (isEdit) {
    //   addProductBodyRequest.thumbnail.
    // }
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
